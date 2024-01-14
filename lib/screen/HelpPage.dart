import 'package:flutter/material.dart';
import 'package:task_manager/components/upper_header.dart';
import 'package:task_manager/screen/settings.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
                upperHeader("Help & Support", context, false, SettingsPage()),
                SizedBox(
                  height: h * 0.03,
                ),
                customOptions(Icons.report, "Report a problem", () {},
                    Icons.arrow_forward_ios),
                customOptions(Icons.account_box, "Account Status", () {},
                    Icons.arrow_forward_ios),
                customOptions(Icons.privacy_tip, "Privacy & Security Help",
                    () {}, Icons.arrow_forward_ios),
                customOptions(Icons.request_quote, "Submit Request", () {},
                    Icons.arrow_forward_ios),
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
