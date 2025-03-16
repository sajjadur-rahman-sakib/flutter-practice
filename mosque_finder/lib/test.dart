import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mosque_finder/mosque_finder_provider.dart';
import 'package:mosque_finder/mosque_finder_state.dart';
import 'package:mosque_finder/permission_handler.dart';

class MosqueFinderScreen extends ConsumerStatefulWidget {
  const MosqueFinderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MosqueFinderScreen> createState() => _MosqueFinderScreenState();
}

class _MosqueFinderScreenState extends ConsumerState<MosqueFinderScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _defaultLocation = CameraPosition(
    target: LatLng(23.8103, 90.4125), // Default to Dhaka, Bangladesh
    zoom: 14.0,
  );

  @override
  void initState() {
    super.initState();
    _checkPermissionsAndInitialize();
  }

  Future<void> _checkPermissionsAndInitialize() async {
    bool hasPermission =
        await PermissionHandler.checkLocationPermission(context);
    if (hasPermission) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(mosqueFinderProvider.notifier).getCurrentLocation();
      });
    } else {
      await PermissionHandler.showPermissionDialog(
        context,
        isFirstTime: false,
        onPermissionGranted: () {
          ref.read(mosqueFinderProvider.notifier).getCurrentLocation();
        },
        onPermissionDenied: () {
          // Stay on the screen but use default location
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Using default location. Some features may be limited.'),
              duration: Duration(seconds: 3),
            ),
          );
        },
      );
    }
  }

  Future<void> _moveCameraToCurrentLocation() async {
    final state = ref.read(mosqueFinderProvider);
    if (state.currentLocation == null || !state.isMapInitialized) return;

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: state.currentLocation!,
          zoom: state.zoom,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mosqueFinderProvider);

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _defaultLocation,
            markers: state.markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              ref.read(mosqueFinderProvider.notifier).setMapInitialized(true);
              if (state.currentLocation != null) {
                _moveCameraToCurrentLocation();
              }
            },
            onCameraMove: (position) {
              ref.read(mosqueFinderProvider.notifier).updateZoom(position.zoom);
            },
          ),
          _buildAppBar(),
          _buildSearchRadiusCard(state),
          if (state.isLoading) _buildLoadingIndicator(),
          if (state.error != null) _buildErrorOverlay(state.error!),
        ],
      ),
      floatingActionButton: _buildFloatingActionButtons(),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF16C47F),
              const Color(0xFF16C47F).withOpacity(0.9),
              const Color(0xFF16C47F).withOpacity(0),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                'Mosque Finder',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchRadiusCard(MosqueFinderState state) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 70.h,
      left: 16.w,
      right: 16.w,
      child: Card(
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search Radius',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: DropdownButton<String>(
                        value: state.searchRadius,
                        isExpanded: true,
                        underline: const SizedBox(),
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Color(0xFF16C47F)),
                        items: [
                          _buildDropdownItem('500', '500m'),
                          _buildDropdownItem('1000', '1km'),
                          _buildDropdownItem('2000', '2km'),
                          _buildDropdownItem('5000', '5km'),
                        ],
                        onChanged: (String? value) {
                          if (value != null) {
                            ref
                                .read(mosqueFinderProvider.notifier)
                                .updateSearchRadius(value);
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  ElevatedButton.icon(
                    onPressed: () => ref
                        .read(mosqueFinderProvider.notifier)
                        .getCurrentLocation(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF16C47F),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    icon: const Icon(Icons.my_location, size: 18),
                    label: const Text('Current Location'),
                  ),
                ],
              ),
              if (state.hasFoundMosques) ...[
                SizedBox(height: 8.h),
                Text(
                  'Found ${state.mosqueCount} mosques nearby',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF16C47F)),
              ),
              SizedBox(height: 16.h),
              Text(
                'Finding Mosques...',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorOverlay(String error) {
    return GestureDetector(
      onTap: () => ref.read(mosqueFinderProvider.notifier).clearError(),
      child: Container(
        color: Colors.black.withOpacity(0.3),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            padding: EdgeInsets.all(24.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red[400],
                  size: 48.sp,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Error',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  error,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(mosqueFinderProvider.notifier).clearError();
                      ref
                          .read(mosqueFinderProvider.notifier)
                          .getCurrentLocation();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF16C47F),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.refresh, size: 20),
                        SizedBox(width: 8.w),
                        const Text('Retry'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButtons() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'refresh',
            onPressed: () =>
                ref.read(mosqueFinderProvider.notifier).searchNearbyMosques(),
            backgroundColor: const Color(0xFF16C47F),
            child: const Icon(Icons.refresh),
          ),
          SizedBox(height: 16.h),
          FloatingActionButton(
            heroTag: 'zoom',
            onPressed: _moveCameraToCurrentLocation,
            backgroundColor: Colors.white,
            child:
                const Icon(Icons.center_focus_strong, color: Color(0xFF16C47F)),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> _buildDropdownItem(String value, String label) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
