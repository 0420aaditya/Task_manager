import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/dashboard.dart';
import 'package:task_manager/login_page.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({Key? key}) : super(key: key);

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    // Call checkUser method to determine the initial screen
    return FutureBuilder(
      future: checkUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // if (snapshot.connectionState == ConnectionState.done):
          //  This condition checks whether the asynchronous operation is complete.
          //  If the connection state is done, it means that the Future has completed,
          //   and the result is available in the snapshot.
          return snapshot.data ?? const Placeholder();
        } else {
          return const CircularProgressIndicator();
          //returns animation that checking process is not completed (loading)
        }
      },
    );
  }

  // checking whether the user is set or not using currentUser
  // here we use user variable to store the user status
  Future<Widget> checkUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return Dashboard();
    } else {
      return LoginPage();
    }
  }
}
