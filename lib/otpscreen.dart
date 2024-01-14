import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_manager/uihelper.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  String verificationId = "";

  @override
  void initState() {
    super.initState();
    // Retrieve the verification ID from the previous screen or wherever you stored it
    // (e.g., from the codeSent callback in the previous screen)
    // For demonstration purposes, it is set to an empty string here.
    verificationId = "";
  }

  void verifyOTP() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text,
      );

      // Sign in with the phone credentials
      await FirebaseAuth.instance.signInWithCredential(credential);

      // If the above line doesn't throw an error, verification is successful
      // Navigate to the next screen or perform any action as needed

      // For demonstration purposes, a simple alert is shown
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Verification Successful"),
            content: Text("OTP has been successfully verified!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Add any navigation or further actions here
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Handle verification failure
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Verification Failed"),
            content: Text("Invalid OTP. Please try again."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Add any navigation or further actions here
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Your OTP input field
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter OTP",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),

            // Button to verify OTP
            UiHelper.buildCustomButton(context,
                buttonText: "verify", onPressed: verifyOTP),
          ],
        ),
      ),
    );
  }
}
