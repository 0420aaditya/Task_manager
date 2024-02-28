//*******************For Firebase Notification*****************************/
//*************************************************************************/
// import 'dart:math';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationServices {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   void requestNotificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print("Permission granted");
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print("Provisional Permission granted");
//     } else {
//       print("Permission Denied!");
//     }
//   }

//   void initLocalNotification(
//       BuildContext context, RemoteMessage message) async {
//     var androidInitializationSettings =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iosInitializationSettings = const DarwinInitializationSettings();

//     var initializationSettings = InitializationSettings(
//         android: androidInitializationSettings, iOS: iosInitializationSettings);
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (payload) {});
//   }

//   void initFirebaseNotification() {
//     FirebaseMessaging.onMessage.listen((message) {
//       showNotification(message);
//     });
//   }

//   Future<void> showNotification(RemoteMessage message) async {
//     // Generate a unique ID for each notification
//     int notificationId = Random.secure().nextInt(100000);

//     // Create an Android notification channel
//     AndroidNotificationChannel androidNotificationChannel =
//         AndroidNotificationChannel(
//       notificationId.toString(),
//       "Reminder Notification",
//       importance: Importance.max,
//     );

//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       androidNotificationChannel.id,
//       androidNotificationChannel.name,
//       channelDescription: "Your Channel Description",
//       importance: Importance.high,
//       priority: Priority.high,
//       ticker: "ticker",
//     );

//     // For iOS
//     const DarwinNotificationDetails darwinNotificationDetails =
//         DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );

//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: darwinNotificationDetails,
//     );

//     // Show the notification
//     Future.delayed(Duration.zero, () {
//       _flutterLocalNotificationsPlugin.show(
//         notificationId,
//         message.notification!.title.toString(),
//         message.notification!.body.toString(),
//         notificationDetails,
//       );
//     });
//   }

//   Future<String?> getDeviceToken() async {
//     String? token = await messaging.getToken();
//     return token;
//   }

//   void isTokenRefresh() {
//     messaging.onTokenRefresh.listen((event) {
//       event.toString();
//     });
//   }
// }

//****************************Local Notification****************************/
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final onClickNotification = BehaviorSubject<String>();

  static int get id => 1;

  //on tap notification
  static void onNotificationTap(NotificationResponse notificationResponse) {
    onClickNotification.add(notificationResponse.payload!);
  }

  static Future init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: (id, title, body, payload) => null);
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  }

  //show notification
  static Future showNotification(
      {String? title, String? body, String? payload}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: null);
  }

  //Scheduled notification
  static Future<void> showScheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async =>
      _flutterLocalNotificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          tz.TZDateTime.from(scheduledDate, tz.local),
          await notificationDetails(),
          payload: "payload",
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
  static notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "channelId 2",
        "channelName",
        importance: Importance.max,
        // sound: RawResourceAndroidNotificationSound('notification')
      ),
      //iOS:
    );
  }
}
