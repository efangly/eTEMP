import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    if (Platform.isIOS) {
      String? apnsToken = await _firebaseMessaging.getAPNSToken();
      if (apnsToken != null) {
        await _firebaseMessaging.subscribeToTopic('test');
      } else {
        await Future<void>.delayed(
          const Duration(
            seconds: 3,
          ),
        );
        apnsToken = await _firebaseMessaging.getAPNSToken();
        if (apnsToken != null) {
          await _firebaseMessaging.subscribeToTopic('test');
        }
      }
    } else {
      await _firebaseMessaging.subscribeToTopic('test');
    }
    // await _firebaseMessaging.subscribeToTopic('test');
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static Future<void> messagingBackgroundHandler(RemoteMessage message) async {
    if (kDebugMode) {
      print("Bg Message: ${message.notification?.title}");
      print("Bg Message: ${message.notification?.body}");
      print("Bg Message: ${message.data.toString()}");
    }
  }
}
