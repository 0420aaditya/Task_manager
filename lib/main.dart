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
import 'package:flutter/material.dart';
import 'package:task_manager/auth/main_page.dart';
import 'package:task_manager/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
