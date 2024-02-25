import 'package:covid_counter/firebaseimplementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable_Widget/resuable_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuthServices _auth = FirebaseAuthServices();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  @override
  void dispose() {
    namecontroller.dispose();
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
        padding: const EdgeInsets.all(12),
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
          // color: Color.fromARGB(255, 162, 235, 181), // Container color
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
          children: <Widget>[
            Expanded(flex: 2, child: covidlogo('asset/covidimage.png')),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
                height: 52,
                child: reusabletextFormField("Enter name",
                    Icons.person_2_outlined, false, namecontroller)),
            const SizedBox(
              height: 9,
            ),
            SizedBox(
              height: 52,
              child: reusabletextFormField(
                  "Enter email", Icons.email_outlined, false, emailcontroller),
            ),
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
            SizedBox(
              height: 38,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _signup();
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 241, 241, 241))),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 44, 43, 43)),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _signup() async {
    String username = namecontroller.text;
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    User? user = await _auth.signupWithEmailAndPassword(email, password);
    if (user != null) {
      print("work is done ");
      Navigator.pushReplacementNamed(context, '/homescreen');
    } else {
      print("there is some error");
    }
  }
}
