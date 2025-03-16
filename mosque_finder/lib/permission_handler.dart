import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;
import 'package:shared_preferences/shared_preferences.dart';

class PermissionHandler {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  
  // Check if location services are enabled
  static Future<bool> checkLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    return true;
  }

  // Open location settings
  static Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  // Request location permission
  static Future<LocationPermission> requestLocationPermission() async {
    return await Geolocator.requestPermission();
  }

  // Check location permission
  static Future<bool> checkLocationPermission(BuildContext context) async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (context.mounted) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Location Services Disabled'),
                content: const Text('Please enable location services to use this feature.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await openLocationSettings();
                    },
                    child: const Text('Open Settings'),
                  ),
                ],
              );
            },
          );
        }
        return false;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      return permission == LocationPermission.whileInUse || 
             permission == LocationPermission.always;
    } catch (e) {
      debugPrint('Error checking location permission: $e');
      return false;
    }
  }

  // Initialize notifications
  static Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap
      },
    );

    if (Platform.isAndroid) {
      await _notificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
  }

  // Check notification permission
  static Future<bool> checkNotificationPermission() async {
    if (Platform.isAndroid) {
      final status = await _notificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.areNotificationsEnabled() ?? false;
      return status;
    }
    return false;
  }

  // Request all required permissions
  static Future<bool> requestAllPermissions(BuildContext context) async {
    // First check if location service is enabled
    bool serviceEnabled = await checkLocationService();
    if (!serviceEnabled) {
      if (context.mounted) {
        await openLocationSettings();
      }
      return false;
    }

    // Request location permission
    LocationPermission locationPermission = await requestLocationPermission();
    if (locationPermission == LocationPermission.denied || 
        locationPermission == LocationPermission.deniedForever) {
      return false;
    }

    // Initialize and request notification permission
    await initializeNotifications();
    bool hasNotificationPermission = await checkNotificationPermission();

    // Save permission status
    if (context.mounted) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('has_enabled_permissions_once', true);
    }

    return (locationPermission == LocationPermission.whileInUse || 
            locationPermission == LocationPermission.always) && 
            hasNotificationPermission;
  }

  // Show permission dialog
  static Future<void> showPermissionDialog(BuildContext context, {
    required bool isFirstTime,
    required Function onPermissionGranted,
    required Function onPermissionDenied,
  }) async {
    bool? dialogResult = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Column(
            children: [
              Icon(
                Icons.mosque_outlined,
                size: 48,
                color: const Color(0xFF16BC88),
              ),
              const SizedBox(height: 16),
              Text(
                isFirstTime ? 'Welcome to Ramadan Tracker' : 'Enable Permissions',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isFirstTime
                    ? 'To provide you with accurate prayer times and notifications:'
                    : 'Please enable these permissions to get the best experience:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16),
              FutureBuilder<bool>(
                future: checkLocationPermission(dialogContext),
                builder: (context, snapshot) {
                  return _buildPermissionItem(
                    icon: Icons.location_on_outlined,
                    title: 'Location Access',
                    description: 'For accurate prayer times based on your location',
                    isEnabled: snapshot.data ?? false,
                  );
                },
              ),
              const SizedBox(height: 12),
              FutureBuilder<bool>(
                future: checkNotificationPermission(),
                builder: (context, snapshot) {
                  return _buildPermissionItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    description: 'To remind you of prayer times and tasks',
                    isEnabled: snapshot.data ?? false,
                  );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: Text(
                'Not Now',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF16BC88),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Enable',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );

    if (dialogResult == true && context.mounted) {
      bool granted = await requestAllPermissions(context);
      if (granted) {
        onPermissionGranted();
      } else {
        onPermissionDenied();
      }
    } else {
      onPermissionDenied();
    }
  }

  static Widget _buildPermissionItem({
    required IconData icon,
    required String title,
    required String description,
    required bool isEnabled,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF16BC88).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isEnabled ? const Color(0xFF16BC88) : Colors.grey,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    isEnabled ? Icons.check_circle : Icons.error_outline,
                    size: 16,
                    color: isEnabled ? const Color(0xFF16BC88) : Colors.grey,
                  ),
                ],
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 