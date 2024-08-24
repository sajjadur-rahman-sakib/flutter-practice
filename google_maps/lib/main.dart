import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps"),
        centerTitle: true,
      ),
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: const CameraPosition(
          target: LatLng(22.464962631637007, 90.3828223985226),
          zoom: 17.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _googleMapController = controller;
        },
        onTap: (LatLng latLng) {
          debugPrint(latLng.toString());
        },
        zoomControlsEnabled: true,
        myLocationButtonEnabled: true,
        polylines: <Polyline>{
          Polyline(
            polylineId: const PolylineId('sample'),
            color: Colors.pink,
            width: 10,
            visible: true,
            onTap: () {
              print("Tap on polyline");
            },
            jointType: JointType.round,
            points: const [
              LatLng(22.46280250579515, 90.3823659941554),
              LatLng(22.464263074353763, 90.38248032331467),
              LatLng(22.464440609533536, 90.37999391555786),
            ],
          ),
          const Polyline(
              polylineId: PolylineId('second'),
              color: Colors.blue,
              width: 10,
              visible: true,
              points: [
                LatLng(22.464300254514963, 90.38247998803854),
                LatLng(22.465786523288116, 90.3826566785574),
                LatLng(22.465692954200403, 90.38343485444784)
              ]),
        },
        circles: <Circle>{
          Circle(
            circleId: CircleId('PSTU circle'),
            center: LatLng(22.464393204874277, 90.38246188312769),
            radius: 300,
            strokeWidth: 5,
            strokeColor: Colors.brown,
            fillColor: Colors.yellow.withOpacity(0.1),
            onTap: () {
              print('PSTU circle');
            },
          ),
        },
        polygons: <Polygon>{
          const Polygon(
            polygonId: PolygonId('polygon'),
            fillColor: Colors.blue,
            points: [
              LatLng(22.467015308821356, 90.39075460284948),
              LatLng(22.465519448440062, 90.39735149592161),
              LatLng(22.46074082851526, 90.39793085306883),
              LatLng(22.456108914194868, 90.39199713617563),
              LatLng(22.4590707668761, 90.38906447589397),
              LatLng(22.463274388241096, 90.3893293440342),
            ],
          ),
        },
        markers: <Marker>{
          const Marker(
            markerId: MarkerId('Marker'),
            position: LatLng(22.465692024705838, 90.387177541852),
            infoWindow: InfoWindow(title: 'BSMRH'),
            icon: BitmapDescriptor.defaultMarker,
          ),
          Marker(
            markerId: MarkerId('location-picker'),
            position: LatLng(22.465686757569834, 90.38949564099312),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange,
            ),
            draggable: true,
            onDrag: (LatLng latLng) {
              print('Start Location: $latLng');
            },
            onDragEnd: (LatLng latLng) {
              print('End Location: $latLng');
            },
          )
        },
      ),
    );
  }
}
