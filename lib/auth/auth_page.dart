import 'package:flutter/material.dart';
import 'package:task_manager/screen/SignUp.dart';
import 'package:task_manager/screen/login.dart';

class Auth_Page extends StatefulWidget {
  Auth_Page({super.key});

  @override
  State<Auth_Page> createState() => _Auth_PageState();
}

/// The `_Auth_PageState` class is a stateful widget that toggles between a login screen and a signup
/// screen based on the value of the boolean variable `a`.
class _Auth_PageState extends State<Auth_Page> {
  bool a = true;
  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LogIN_Screen(to);
    } else {
      return SignUp_Screen(to);
    }
  }
}
