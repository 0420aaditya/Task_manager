import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/uihelper.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    forgotPassword(String email) async {
      try {
        email = email.trim(); // Trim leading and trailing spaces
        if (email == "") {
          return UiHelper.CustomAlertBox(
              context, "Enter an email to reset the password");
        } else {
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
          return UiHelper.CustomAlertBox(
              context, "Password reset email sent successfully to the $email");
        }
      } catch (e) {
        return UiHelper.CustomAlertBox(context, "Error sending mail $e");
      }
    }

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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "your email id",
                        prefixIcon: Icon(
                          Icons.email,
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
              onTap: () {
                // Call the forgotPassword function with the email from the controller
                forgotPassword(emailController.text.toString());
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
