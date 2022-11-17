import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: const Center(
        child: Text("Hello World")
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Hello world!");
        },
        child: Text("Hello"),
      ),
    ),
  ));
}


