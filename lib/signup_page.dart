import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/login_page.dart';
import 'package:task_manager/uihelper.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

//create User
    signUP(String email, String password) async {
      //to remove the whitespace used trim() in the input field
      email = email.trim();
      password = password.trim();
      //Uded trim() to remove the whitespace
      if (email == "" && password == "") {
        UiHelper.CustomAlertBox(context, "Enter required Fields!");
      } else {
        UserCredential? usercredential;
        //credential is the credential by user!
        try {
          //all the exceptations will be handled by firebase
          usercredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) {
            //.then() le user create vaye paxi k garni vanni kura garxa
            //if user created then navigate to login page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          });
        } on FirebaseAuthException catch (e) {
          return UiHelper.CustomAlertBox(context, e.code.toString());
          //e.code.toString() means e vaneko exceptation jun code through generate hunxa
          //ani teslai string ma convert garera display garauni
        }
      }
    }
    //signUp function upto here

    // List for images like google, fb, twitter
    List images = ["g.png", "t.png", "f.png"];

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
                    backgroundColor: Colors.white70,
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
                  SizedBox(height: 20),

                  // Adjusted for responsiveness
                  Container(
                    width: w * 0.9, // Adjusted width to 90% of the screen width
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

                  SizedBox(height: 20),

                  // Adjusted for responsiveness
                  Container(
                    width: w * 0.9, // Adjusted width to 90% of the screen width
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
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.lock_rounded,
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

            // Sign up button
            GestureDetector(
              onTap: () {
                signUP(emailController.text.toString(),
                    passwordController.text.toString());
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
                    "Sign up",
                    style: TextStyle(
                      fontSize: w * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // For Create account text
            SizedBox(height: 20),
            Text(
              "Sign up using one of the following",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),

            //********************To display in a row (For sign-up methods) *********************/
            Wrap(
              alignment: WrapAlignment.center,
              children: List<Widget>.generate(
                3,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color.fromARGB(255, 39, 113, 173),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          "../img/${images[index]}",
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
