import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task_manager/const/colors.dart';
import 'package:task_manager/notificationServices.dart';
import 'package:task_manager/screen/add_note_screen.dart';
import 'package:task_manager/screen/settings.dart';
import 'package:task_manager/widgets/appDrawer.dart';
import 'package:task_manager/widgets/stream_note.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

bool show = true;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _Home_ScreenState extends State<Home_Screen> {
  @override
  void initState() {
    //listenToNotifications();
    super.initState();
  }

  //to listen to any notification clicked or not
  // listenToNotifications() {
  //   print('Listening to the notification');
  //   NotificationService.onClickNotification.stream.listen((event) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => SettingsPage(payload: event)));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: backgroundColors,
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      drawer: AppDrawer(onItemTap: () {
        // Handle drawer item tap as needed
        Navigator.pop(context); // Close the drawer after handling the tap
      }),
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            NotificationService.showNotification(
                title: 'Test',
                body: 'Works Fine!',
                payload: "Is a simple payload");
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Add_creen(),
            ));
          },
          backgroundColor: custom_green,
          child: Icon(Icons.add, size: 30),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stream_note(false),
                Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Stream_note(true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void openDrawer() {
  _scaffoldKey.currentState?.openDrawer();
}
