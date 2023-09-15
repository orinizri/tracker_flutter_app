import 'package:flutter/material.dart';
import 'package:tracker_app/home_page.dart';
import 'package:tracker_app/nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              NavBar(),
              Expanded(child: HomePage()),
            ],
          ),
        ),
      ),
    );
  }
}