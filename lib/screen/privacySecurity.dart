import 'package:flutter/material.dart';
import 'package:task_manager/components/customText.dart';
import 'package:task_manager/components/upper_header.dart';
import 'package:task_manager/screen/changePassword.dart';
import 'package:task_manager/screen/settings.dart';

class privacySecurity extends StatefulWidget {
  const privacySecurity({super.key});

  @override
  State<privacySecurity> createState() => privacySecurityState();
}

class privacySecurityState extends State<privacySecurity> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(left: h * 0.03, right: h * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                upperHeader(
                    "Privacy & Security", context, false, SettingsPage()),
                SizedBox(
                  height: h * 0.03,
                ),
                // Text(
                //   "Login & Security",
                //   style: TextStyle(
                //       fontSize: 20,
                //       color: Colors.grey[100],
                //       fontWeight: FontWeight.bold),
                // ),
                customText("Login & Security", 20),
                customOptions(Icons.lock, "Password", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen()));
                }, Icons.arrow_forward_ios),
                customOptions(Icons.account_box, "My Account", () {},
                    Icons.arrow_forward_ios),
                customOptions(
                    Icons.download, "My Data", () {}, Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customOptions(
    IconData icon, String label, VoidCallback onTap, IconData icon2) {
  return ListTile(
    leading: Icon(icon, color: Color(0xFF2C3E50)),
    //leading is used before title
    title:
        Text(label, style: TextStyle(color: Color(0xFF2C3E50), fontSize: 18)),
    onTap: onTap,
    trailing: Icon(icon2, color: Color(0xFF2C3E50)),
    //trailing is used after the title
  );
}
