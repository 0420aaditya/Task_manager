import 'package:flutter/material.dart';

class UiHelper {
  static CustomAlertBox(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static Widget buildCustomButton(
    BuildContext context, {
    required String buttonText,
    required VoidCallback onPressed,
    double widthFactor = 0.5,
    double heightFactor = 0.08,
    String backgroundImage = "../img/bg.png",
    double fontSizeFactor = 0.06,
    Color clickedColor =
        Colors.grey, // Specify the color when the button is clicked
  }) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: w * widthFactor,
        height: h * heightFactor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
          color: Colors.transparent, // Set the initial color
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: w * fontSizeFactor,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onTapDown: (details) {
        // Handle the button pressed effect
        _updateButtonColor(context, clickedColor);
      },
      onTapCancel: () {
        // Reset the button color when the tap is canceled
        _updateButtonColor(context, Colors.transparent);
      },
      onTapUp: (details) {
        // Reset the button color when the tap is released
        _updateButtonColor(context, Colors.transparent);
      },
    );
  }

//for clicking effect
  static void _updateButtonColor(BuildContext context, Color color) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        backgroundColor: color,
        content: Container(),
        actions: [],
      ),
    );
  }
}
