import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/dashboard.dart';
import 'package:task_manager/forgot_password.dart';
import 'package:task_manager/signup_page.dart';
import 'package:task_manager/uihelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controllers for email and password
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //controllers for email and passwords

  login(String email, String password) async {
    if (email == "" && password == "") {
      email = email.trim();
      email = email.trim();
      return UiHelper.CustomAlertBox(context, "Enter Required Fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        });
      } on FirebaseAuthException catch (e) {
        return UiHelper.CustomAlertBox(context, e.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double w = constraints.maxWidth;
          double h = constraints.maxHeight;

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: w,
                  height: h * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("../img/bgCopy.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                          fontSize: w * 0.15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Sign in to your account",
                        style: TextStyle(
                          fontSize: w * 0.05,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(w * 0.05),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: w * 0.02,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Your email Id",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color.fromARGB(255, 39, 113, 173),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.05),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.05),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.015),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(w * 0.05),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: w * 0.02,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock_rounded,
                                color: Color.fromARGB(255, 39, 113, 173)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.05),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.05),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // Added alignment property
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  // Navigate to ForgotPassword on tap
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ForgotPassword(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Forgot your Password?",
                                  style: TextStyle(
                                    fontSize: w * 0.05,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                GestureDetector(
                  onTap: () {
                    // Call the login function on tap
                    login(emailController.text.toString(),
                        passwordController.text.toString());
                  },
                  child: Container(
                    width: w * 0.5,
                    height: h * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w * 0.05),
                      image: DecorationImage(
                        image: AssetImage("../img/bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: w * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: w * 0.1),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: w * 0.04,
                    ),
                    children: [
                      TextSpan(
                        text: "Create",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: w * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to SignUpPage on tap
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
