import 'package:flutter/material.dart';
import 'package:google_map/core/dependency_injection.dart';
import 'package:google_map/ui/screens/home_screen.dart';
import 'package:get/get.dart';

class GoogleMapApp extends StatelessWidget {
  const GoogleMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: DependencyInjection(),
      home: const HomeScreen(),
      theme: ThemeData(),
    );
  }
}
