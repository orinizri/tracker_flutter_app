import 'package:flutter/material.dart';
import 'package:tracker_app/home_page.dart';
import 'package:tracker_app/nav_bar.dart';

void main() {
  runApp(const MyApp());
}

var kColorSchema =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 117, 2, 138));
var kCDarkColorSchema =
    ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Color.fromARGB(255, 194, 128, 206),
      );

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kCDarkColorSchema,
      ),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorSchema,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorSchema.onPrimaryContainer,
            foregroundColor: kColorSchema.onPrimary,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorSchema.secondaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: kColorSchema.primaryContainer,
          )),
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                color: kColorSchema.onSecondaryContainer,
              ))),
      home: const Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: HomePage(),
              ),
            ],
          ),
        ),
      ),
      themeMode: ThemeMode.system,
    );
  }
}
