import 'package:flutter/material.dart';
import 'package:sofe4640_finalproject/registerPage.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage();

}

class _LoginPage extends State<loginPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: ListView(
            children:  [
            // Logo
              Image.asset('assets/logo/logo.png'),
            // username textfield
              const TextField(
                decoration: InputDecoration(
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
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
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
              Container(
                child: Center(
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
                    },
                  )
                ),
              ),

              const SizedBox(height: 30),
              // Register button
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
        ),
      )
    );
  }

}
