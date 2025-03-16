import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mosque_finder/mosque_finder_state.dart';

const String googleApiKey = 'AIzaSyDFQ3pm9BAlkTJiE2AU1UDpG5ao2PJk0hc';

final mosqueFinderProvider =
    StateNotifierProvider<MosqueFinderNotifier, MosqueFinderState>(
  (ref) => MosqueFinderNotifier(),
);

class MosqueFinderNotifier extends StateNotifier<MosqueFinderState> {
  MosqueFinderNotifier() : super(const MosqueFinderState());

  Future<bool> _checkConnectivity() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      return connectivityResult != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }

  Future<void> checkLocationServices() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      state = state.copyWith(isLocationEnabled: serviceEnabled);
      
      if (!serviceEnabled) {
        throw Exception('Location services are disabled');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      final hasPermission = permission != LocationPermission.denied && 
                          permission != LocationPermission.deniedForever;
      
      state = state.copyWith(hasLocationPermission: hasPermission);

      if (!hasPermission) {
        throw Exception('Location permission denied');
      }
    } catch (e) {
      state = state.copyWith(
        error: ErrorHandler.getErrorMessage(e),
        isLocationEnabled: false,
        hasLocationPermission: false,
      );
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      await checkLocationServices();
      if (!state.isLocationEnabled || !state.hasLocationPermission) return;

      final hasConnection = await _checkConnectivity();
      if (!hasConnection) {
        throw Exception('No internet connection available');
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      
      state = state.copyWith(
        currentLocation: LatLng(position.latitude, position.longitude),
        isLoading: false,
      );
      
      await searchNearbyMosques();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  Future<void> searchNearbyMosques() async {
    if (!state.canSearchMosques) return;

    try {
      state = state.copyWith(isLoading: true, error: null);
      
      final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=${state.currentLocation!.latitude},${state.currentLocation!.longitude}'
        '&radius=${state.searchRadius}'
        '&type=mosque'
        '&key=$googleApiKey',
      );

      final response = await http.get(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw Exception('Request timed out'),
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200 && data['status'] == 'OK') {
        final Set<Marker> markers = {};
        
        // Add current location marker
        markers.add(
          Marker(
            markerId: const MarkerId('current_location'),
            position: state.currentLocation!,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: const InfoWindow(title: 'Your Location'),
          ),
        );

        // Add mosque markers
        for (var place in data['results']) {
          if (place['geometry']?['location'] != null) {
            final location = place['geometry']['location'];
            markers.add(
              Marker(
                markerId: MarkerId(place['place_id'] ?? DateTime.now().toString()),
                position: LatLng(location['lat'], location['lng']),
                infoWindow: InfoWindow(
                  title: place['name'] ?? 'Mosque',
                  snippet: place['vicinity'] ?? 'No address available',
                ),
              ),
            );
          }
        }

        state = state.copyWith(
          markers: markers,
          isLoading: false,
          error: markers.length == 1 ? 'No mosques found in this area' : null,
        );
      } else {
        throw Exception(_getErrorMessage(data['status']));
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: ErrorHandler.getErrorMessage(e),
      );
    }
  }

  String _getErrorMessage(String? status) {
    switch (status) {
      case 'ZERO_RESULTS':
        return 'No mosques found in this area. Try increasing the search radius.';
      case 'OVER_QUERY_LIMIT':
        return 'API query limit exceeded. Please try again later.';
      case 'REQUEST_DENIED':
        return 'API request was denied. Please check your API key.';
      case 'INVALID_REQUEST':
        return 'Invalid request parameters. Please try again.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }

  void updateSearchRadius(String radius) {
    state = state.copyWith(searchRadius: radius);
    searchNearbyMosques();
  }

  void setMapInitialized(bool initialized) {
    state = state.copyWith(isMapInitialized: initialized);
  }

  void updateZoom(double zoom) {
    state = state.copyWith(zoom: zoom);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
} 