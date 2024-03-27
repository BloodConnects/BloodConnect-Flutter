import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> configure() async {
    await requestNotificationPermission();
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the incoming message when the app is in the foreground.
      print("FCM Message: ${message.notification?.title}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle the incoming message when the app is in the background.
      print("FCM Message opened from terminated state: ${message.notification?.title}");
    });
  }
  Future<void> requestNotificationPermission() async {
    try {
      NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      print("Notification permission status: ${settings.authorizationStatus}");
    } catch (e) {
      print("Error requesting notification permission: $e");
    }
  }
}
