import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class NotificationSetup {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initializeNotificatiion() async {
    AwesomeNotifications().initialize(
      '',
      [
        NotificationChannel(
          channelKey: 'high_importance_channel',
          channelName: 'notifications',
          channelDescription: 'blood notifications',
          channelShowBadge: true,
          vibrationPattern: highVibrationPattern,
        ),
      ],
    );

    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
  }

  void configurePushNotifications(BuildContext context) async {
    initializeNotificatiion();

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // if(Platform.isIOS) getIosPermissions();

    FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.notification!.body}');

      if (message.notification != null) {
        createOrderNotification(
            title: message.notification!.title,
            body: message.notification!.body);
      }
    });
  }

  void getIosPermissions() {
    _firebaseMessaging.requestPermission(
        alert: true, sound: true, badge: true, provisional: false);
  }

  Future<void> createOrderNotification({String? title, String? body}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'high_importance_channel',
        title: title,
        body: body,
      ),
    );
  }

  void eventListnerCallback(BuildContext context) {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceiverMethod,
    );
  }
}

@pragma("vm:entry-point")
Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onActionReceiverMethod(
      ReceivedNotification receivedNotification) async {}
}
