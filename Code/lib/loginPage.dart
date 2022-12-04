import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sofe4640_finalproject/mainPage.dart';
import 'package:sofe4640_finalproject/registerPage.dart';


class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage();

}

class _LoginPage extends State<loginPage>{
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      email.dispose();
      password.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body:
          Padding(
            padding: const EdgeInsets.all(30.0),
              child: Center(
                child: ListView(
                  children:  [
                    // Logo
                    Image.asset('assets/images/logo/logo.png'),
                    // username textfield
                    TextField(
                      controller: email,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.redAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.redAccent),
                        ),
                        filled: true,
                        fillColor: Colors.white60,
                      ),
                    ),

          const SizedBox(height: 20),

          // password textfield
          TextField(
            controller: password,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.redAccent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.redAccent),
              ),
            filled: true,
            fillColor: Colors.white60,
              ),
            ),

          const SizedBox(height: 30),

          // login in button
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(200, 50),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
              ),
              child: const Text('Login'),
              onPressed: () {
                logIn();
              },
            )
          ),

          const SizedBox(height: 30),


          // Register button
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const registerPage())
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: "New user? ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Register now", style: TextStyle(color: Colors.red))
                          ]
                      )
                    )
                  ),
                ),
              ),
            ],
          ),
                  ],
                ),
              ),
            )
        );
    }

    Future logIn() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text,
            password: password.text
        );
        if (mounted) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const mainPage()),
          );
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login successful"),
          ));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Wrong password"),
          ));
        }
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("User not found"),
          ));
        }
        if (e.code == 'invalid-email') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid email"),
          ));
        }
      }
    }
}



