import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPage();

}

class _RegisterPage extends State<registerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text("Register"),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),

        body: Padding (
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: ListView(
              children:  [
                Text(
                  "Create account",
                  style: GoogleFonts.bebasNeue(
                      fontSize: 60,
                      height: 0.9
                  ),
                  textAlign: TextAlign.center,
                  ),
                Text(
                    "Enter your Name, Email, Phone Number, and Password to Sign up",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                    ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                //First textbox
                const TextField(
                  decoration: InputDecoration(
                    labelText: "First Name",
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

                //Last Name textbox
                TextField(
                  decoration: InputDecoration(
                    labelText: "Last Name",
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

                //Email textbox
                TextField(
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

                //Phone number textbox
                TextField(
                  decoration: InputDecoration(
                    labelText: "Phone number",
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

                //Password textbox

                TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
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

                const SizedBox(height: 40),

                // Create an account button
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
                        child: const Text('Create an account'),
                        onPressed: () {
                        },
                      )
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}