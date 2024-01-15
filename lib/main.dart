// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:task_manager/checkuser.dart';
// import 'package:task_manager/forgot_password.dart';
// import 'package:task_manager/login_page.dart';
// import 'package:task_manager/otpscreen.dart';
// import 'package:task_manager/phoneauth.dart';

// void main() async {
//   //ensures that flutter is connected to firebase
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: "AIzaSyB3WcXlVoesdWbqqTqqepwlQGyOFdJrQO8",
//       authDomain: "task-manager-3e5ea.firebaseapp.com",
//       projectId: "task-manager-3e5ea",
//       //storageBucket: "task-manager-3e5ea.appspot.com",
//       messagingSenderId: "953166878169",
//       appId: "1:953166878169:web:4e9ab58574df61c24cf5c8",
//       // measurementId: "G-DJHL90YMEB"
//     ),
//   ); //initialize Firebase
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Ultimate Task Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CheckUser(),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/auth/main_page.dart';
import 'package:task_manager/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //call the function for notification on background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

//Run the notification in the background
//This should be the top level function
@pragma('vm:entry-point') //firebase bg service start garxa
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString()); //print in console
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main_Page(),
    );
  }
}
