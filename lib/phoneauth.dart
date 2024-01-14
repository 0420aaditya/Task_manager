import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/otpscreen.dart';
import 'package:task_manager/uihelper.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("../img/bgCopy.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    // Adjusted for responsiveness
                    height: h * 0.12,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("../img/profile1.png"),
                    backgroundColor: Colors.white60,
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text Field
                  SizedBox(height: 100),

                  // Adjusted for responsiveness
                  Container(
                    width: w * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "your phone number",
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 39, 113, 173),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Sign up button with GestureDetector
            GestureDetector(
              onTap: () async {
                // Call the function
                try {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted:
                        (PhoneAuthCredential phoneAuthCredential) {
                      // Handle the verification completed event if needed
                      UiHelper.CustomAlertBox(
                          context, "Verification completed");
                    },
                    verificationFailed: (FirebaseAuthException ex) {
                      // Handle the verification failed event if needed
                      UiHelper.CustomAlertBox(
                          context, "Verification failed! $ex");
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      // Handle the code sent event if needed
                      UiHelper.CustomAlertBox(context,
                          "Code sent with verificationID: $verificationId");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OTPScreen()));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {
                      // Handle the code auto-retrieval timeout event if needed
                      UiHelper.CustomAlertBox(context,
                          "Code auto-retrieval timeout with verification ID: $verificationId");
                    },
                    phoneNumber: phoneController.text.toString(),
                  );
                } catch (e) {
                  // Handle exceptions, if any
                  UiHelper.CustomAlertBox(context, "Error! $e");
                }
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage("../img/bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Send",
                    style: TextStyle(
                      fontSize: w * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
