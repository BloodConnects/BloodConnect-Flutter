// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class MyFirebaseMessagingService {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//
//   Future<void> configure() async {
//     // Handle background messages
//     FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
//
//     // Handle foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("FCM Message (foreground): ${message.notification?.title}");
//       // Handle the message when the app is in the foreground.
//       // You can show a local notification or update the UI.
//     });
//
//     // Handle when the app is opened by clicking the notification
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("FCM Message opened from terminated state: ${message.notification?.title}");
//       // Handle the message when the app is in the background or terminated.
//       // You can navigate to a specific page or perform any custom logic here.
//     });
//   }
//
//   Future<void> _onBackgroundMessage(RemoteMessage message) async {
//     // Handle the message when the app is in the background.
//     await _showNotification(message.data['title'], message.data['body']);
//   }
//
//   Future<void> _showNotification(String title, String body) async {
//     // Build and show the notification
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'your_channel_id', // Change this to your channel ID
//       'Channel name',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: 'item x',
//     );
//   }
// }
