import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true, //show in device
      announcement: true, //announces
      badge: true, //allows indicator like 1,2,3..
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      //jaba 1st time notification aauxa (only) iphone teti bela tei bata disable garni option aauxa
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Premission granted");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("Provisional Premission granted");
    } else {
      print("Premission Denied!");
    }
  }

  Future<String?> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }
}
