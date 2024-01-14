import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/login_page.dart';
import 'package:task_manager/uihelper.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    logout() async {
      await FirebaseAuth.instance.signOut().then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      });
    }

    return Scaffold(
      body: Column(
        children: [
          // Image
          Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("../img/signup.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.16,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("../img/profile.png"),
                )
              ],
            ),
          ),

          Container(
            width: w,
            height: h * 0.3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dashboard will be available soon!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50),
                  UiHelper.buildCustomButton(
                    context,
                    buttonText: "Sign Out",
                    onPressed: logout,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
