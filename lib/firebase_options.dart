import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      //kIsWeb is environment variable that identifies if running platform is web
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      // case TargetPlatform.iOS:
      //   return ios;
      // case TargetPlatform.macOS:
      //   return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB3WcXlVoesdWbqqTqqepwlQGyOFdJrQO8',
    appId: '1:953166878169:web:4e9ab58574df61c24cf5c8',
    messagingSenderId: '953166878169',
    projectId: 'task-manager-3e5ea',
    authDomain: 'task-manager-3e5ea.firebaseapp.com',
    storageBucket: 'task-manager-3e5ea.appspot.com',
  );

  //       apiKey: "AIzaSyB3WcXlVoesdWbqqTqqepwlQGyOFdJrQO8",
//       authDomain: "task-manager-3e5ea.firebaseapp.com",
//       projectId: "task-manager-3e5ea",
//       storageBucket: "task-manager-3e5ea.appspot.com",
//       messagingSenderId: "953166878169",
//       appId: "1:953166878169:web:4e9ab58574df61c24cf5c8",
//       measurementId: "G-DJHL90YMEB"

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHUDO7DKWF-0ex8gEAT1MaRyJYuXOys_k',
    appId: '1:953166878169:android:17230ebe159e350b4cf5c8',
    messagingSenderId: '727830725517',
    projectId: 'task-manager-3e5ea',
    storageBucket: 'task-manager-3e5ea.appspot.com',
  );

  // static const FirebaseOptions ios = FirebaseOptions(
  //   apiKey: 'AIzaSyD9iVn-6Ph5fLkQ2_5e3trgE67Spmri9jY',
  //   appId: '1:727830725517:ios:161a0940e6b089849b33c4',
  //   messagingSenderId: '727830725517',
  //   projectId: 'todolist-10ef1',
  //   storageBucket: 'todolist-10ef1.appspot.com',
  //   iosBundleId: 'com.example.flutterToDoList',
  // );

  // static const FirebaseOptions macos = FirebaseOptions(
  //   apiKey: 'AIzaSyD9iVn-6Ph5fLkQ2_5e3trgE67Spmri9jY',
  //   appId: '1:727830725517:ios:6f0305078332755a9b33c4',
  //   messagingSenderId: '727830725517',
  //   projectId: 'todolist-10ef1',
  //   storageBucket: 'todolist-10ef1.appspot.com',
  //   iosBundleId: 'com.example.flutterToDoList.RunnerTests',
  // );
}
