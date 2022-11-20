import 'package:flutter/material.dart';

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
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white60,
                ),
              ),

              SizedBox(height: 20),

            // password textfield
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(30),
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
                      minimumSize: Size(200, 50),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                    child: Text('Login'),
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
                      onPressed: () {},
                      child: RichText(
                        text: const TextSpan(
                            text: "Don't have an account? ",
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
