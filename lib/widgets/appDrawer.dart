import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/screen/HelpPage.dart';
import 'package:task_manager/screen/contactUs.dart';
import 'package:task_manager/screen/settings.dart';

class AppDrawer extends StatelessWidget {
  final VoidCallback onItemTap;

  AppDrawer({required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF2C3E50),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('../images/profile1.png'),
                  radius: 40,
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Everyday is a chance to be ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: 'Better',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20, // Adjust the font size for 'Better'
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          buildDrawerItem(Icons.dashboard, 'Dashboard', onItemTap),
          buildDrawerItem(Icons.person, 'Profile', onItemTap),
          buildDrawerItem(Icons.settings, 'Settings', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
          }),
          buildDrawerItem(Icons.phone, 'Contact Us', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactUsPage()));
          }),
          buildDrawerItem(Icons.info, 'About Us', onItemTap),
          buildDrawerItem(Icons.help, 'Help & Support', () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HelpPage()));
          }),
          buildDrawerItem(
            Icons.logout,
            'Logout',
            () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF2C3E50)),
      title:
          Text(label, style: TextStyle(color: Color(0xFF2C3E50), fontSize: 18)),
      onTap: onTap,
    );
  }
}
