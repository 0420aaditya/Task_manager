import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/screen/HelpPage.dart';

import 'package:task_manager/screen/home.dart';
import 'package:task_manager/screen/privacySecurity.dart';
import 'package:task_manager/widgets/premium.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSoundOn = true;
  bool isNotificationOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2C3E50),
        title: Center(
            child: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        )),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home_Screen()));
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Go to Premium banner
          Container(
            padding: EdgeInsets.all(16),
            child: GoPremium(),
          ),

          // Sound toggle
          SwitchListTile(
            title: Text('Sound'),
            secondary:
                isSoundOn ? Icon(Icons.volume_up) : Icon(Icons.volume_off),
            value: isSoundOn,
            onChanged: (value) {
              setState(() {
                isSoundOn = value;
              });
              // Add your logic for handling sound toggle
              if (isSoundOn) {
                // Sound is on
                // Add logic to perform action when sound is on
              } else {
                // Sound is off
                // Add logic to perform action when sound is off
              }
            },
          ),

          // Notification toggle
          SwitchListTile(
            title: Text('Notifications'),
            secondary: isNotificationOn
                ? Icon(Icons.notifications_active)
                : Icon(Icons.notifications_off),
            value: isNotificationOn,
            onChanged: (value) {
              setState(() {
                isNotificationOn = value;
              });
              // Add your logic for handling notification toggle
              if (isNotificationOn) {
                // Notifications are on
                // Add logic to perform action when notifications are on
              } else {
                // Notifications are off
                // Add logic to perform action when notifications are off
              }
            },
          ),

          // Other Settings Items
          buildSettingsItem(Icons.privacy_tip, 'Privacy & Security', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => privacySecurity()));
          }, Icons.arrow_forward_ios),
          buildSettingsItem(
              Icons.privacy_tip, 'About App', () {}, Icons.arrow_forward_ios),
          buildSettingsItem(Icons.help, 'Help & Support', () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HelpPage()));
          }, Icons.arrow_forward_ios),
          Divider(
            thickness: 2,
            color: Color(0xFF2C3E50).withOpacity(0.3),
          ),
          buildSettingsItem(Icons.logout, 'Quit', () {
            SystemNavigator.pop();
          }, Icons.arrow_forward_ios),
        ],
      ),
      bottomNavigationBar: Container(
        height: 30,
        child: Center(
          child: Text(
            "Version: 1.0",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

Widget buildSettingsItem(
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
