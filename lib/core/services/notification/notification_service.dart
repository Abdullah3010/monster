import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:monster/core/constants/constants.dart';

class NotificationService {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  // static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    // Request permissions
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      debugPrint("Notification permission denied");
      return;
    }

    // Get FCM token
    String? fcmToken = await _firebaseMessaging.getToken();
    debugPrint("FCM Token: $fcmToken");

    // Listen for token refresh
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      debugPrint("FCM Token Refreshed: $newToken");
    });

    // Handle foreground notifications
    FirebaseMessaging.onMessage.listen(_handleForegroundNotification);

    // Handle background and terminated notifications
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationClick);

    setPushNotificationToken();
  }

  static void _handleForegroundNotification(RemoteMessage message) async {
    debugPrint("Foreground Notification Received: ${message.notification?.title}");
    print(" ==========>>>>> Notification Data: ${message.data}");
    print(" ==========>>>>> Notification Data: ${message.toMap()}");
    print(" ==========>>>>> Notification Data: ${message.notification?.toMap()}");
    print(" ==========>>>>> Notification Data: ${message.notification?.title}");
  }

  static void _handleNotificationClick(RemoteMessage message) {
    debugPrint("Notification Clicked: ${message.data}");
    print(" ==========>>>>> Notification Data: ${message.data}");
    print(" ==========>>>>> Notification Data: ${message.toMap()}");
    print(" ==========>>>>> Notification Data: ${message.notification?.toMap()}");
    print(" ==========>>>>> Notification Data: ${message.notification?.title}");
    // Handle navigation or actions when notification is clicked
  }

  static Future<String?> getFCMToken() async {
    return await _firebaseMessaging.getToken();
  }

  static Future<bool> _askPermission() async {
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  static Future<void> setPushNotificationToken() async {
    final result = await _askPermission();
    if (!result) return;

    try {
      final bool isSupported = await FirebaseMessaging.instance.isSupported();
      if (!isSupported) {
        print(' ========>>>>>FCM - Not supported on this platform');
        return;
      }
    } catch (e, s) {
      print(' ========>>>>>Failed to get FCM token-- $e');
      print(' ========>>>>>Failed to get FCM token-- $s');
    }

    // iOS APNs token
    // if (defaultTargetPlatform == TargetPlatform.iOS) {
    //   {
    //     try {
    //       final String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    //       print(' ========>>>>>FCM token-- $apnsToken');
    //       return;
    //     } catch (e, s) {
    //       print(' ========>>>>>Failed to get FCM token-- $e');
    //       print(' ========>>>>>Failed to get FCM token-- $s');
    //     }
    //   }
    // }

    try {
      final String? token = await FirebaseMessaging.instance.getToken();

      print(' ========>>>>>FCM token-- $token');
    } catch (e, s) {
      print(' ========>>>>>Failed to get FCM token-- $e');
      print(' ========>>>>>Failed to get FCM token-- $s');
    }
  }
}
