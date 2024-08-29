import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_map/controller/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Google Map"),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return controller.currentPosition == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    _googleMapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      controller.currentPosition!.latitude,
                      controller.currentPosition!.longitude,
                    ),
                    zoom: 15,
                  ),
                  onTap: (LatLng latLng) {
                    //print(latLng);
                  },
                  circles: (controller.myPosition != null)
                      ? <Circle>{
                          Circle(
                            circleId: const CircleId('my_position_circle'),
                            center: LatLng(
                              controller.myPosition!.latitude,
                              controller.myPosition!.longitude,
                            ),
                            radius: 100,
                            strokeWidth: 4,
                            strokeColor: Colors.grey,
                            fillColor: const Color(0xffcccccc),
                          ),
                        }
                      : {},
                  polylines: <Polyline>{
                    Polyline(
                      polylineId: const PolylineId("user_polyline"),
                      color: Colors.blue,
                      width: 5,
                      points: controller.polylineCoordinates,
                    )
                  },
                  markers: <Marker>{
                    Marker(
                      markerId: const MarkerId("sample-marker-id"),
                      infoWindow: InfoWindow(
                        title: "My current location",
                        snippet:
                            "${controller.currentPosition!.latitude}, ${controller.currentPosition!.longitude}",
                      ),
                      position: LatLng(
                        controller.currentPosition!.latitude,
                        controller.currentPosition!.longitude,
                      ),
                    )
                  },
                );
        },
      ),
    );
  }
}
