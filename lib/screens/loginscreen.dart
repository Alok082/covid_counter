import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firebaseimplementation/firebase_auth_services.dart';
import '../reusable_Widget/resuable_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuthServices _auth = FirebaseAuthServices();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  void dispose() {
    emailcontroller.dispose();

    passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(
            12, MediaQuery.sizeOf(context).height * 0.06, 12, 12),
        height: 700,
        padding: EdgeInsets.fromLTRB(
            12, MediaQuery.sizeOf(context).height * 0.02, 12, 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 245, 97, 86),
              Color.fromARGB(255, 105, 187, 255),
              Color.fromARGB(255, 42, 145, 228),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 255, 76, 76), // Shadow color
              blurRadius: 9.0, // Spread of the shadow
              offset: Offset(0, 0), // Offset in x and y direction
            ),
          ],
          borderRadius:
              BorderRadius.circular(10.0), // Optional: Set border radius
        ),
        // color: Colors.black,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Text(
                "Covid Counter App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 241, 255, 222),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: AutofillHints.email,
                ),
              ),
            ),
            Expanded(flex: 5, child: covidlogo('asset/covidimage.png')),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
                height: 52,
                child: reusabletextFormField("Enter email",
                    Icons.email_outlined, false, emailcontroller)),
            const SizedBox(
              height: 9,
            ),
            SizedBox(
                height: 52,
                child: reusabletextFormField("Enter Password",
                    Icons.lock_outline, true, passwordcontroller)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Forgot Password? ",
              style: TextStyle(color: Color.fromARGB(255, 79, 77, 77)),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 38,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _signIn();
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 241, 241, 241))),
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 44, 43, 43)),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Dont have a account? ",
                  style: TextStyle(color: Color.fromARGB(255, 79, 77, 77)),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/signup'),
                  child: const Text(
                    "Sign Up ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    User? user = await _auth.signinWithEmailAndPassword(email, password);
    if (user != null) {
      print(user);
      Navigator.pushReplacementNamed(context, '/homescreen');
    } else {
      print("there is some error");
    }
  }
}
