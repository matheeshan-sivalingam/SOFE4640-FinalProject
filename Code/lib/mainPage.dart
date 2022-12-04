import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sofe4640_finalproject/loginPage.dart';
import 'package:sofe4640_finalproject/homePage.dart';
import 'package:sofe4640_finalproject/profilePage.dart';
import 'package:sofe4640_finalproject/cartPage.dart';


class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPage();

}

class _MainPage extends State<mainPage> {
  User? user = FirebaseAuth.instance.currentUser;
  int index = 1;
  final screens = [
    const profilePage(),
    const homePage(),
    const cartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
            //Empty for now as the current design is fine
          ),
          child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (index) =>
              setState(() {
                this.index = index;
              }),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.person),
                  label: "Profile",
              ),
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[100],
        );

  }
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const loginPage()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Successfully Logged Out!"),
      ));

    }
  }
}