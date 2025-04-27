import 'package:calculator/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: const HomePage(),

      theme: ThemeData(

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white
        ),

        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)
          ),
          contentPadding: EdgeInsets.all(16)
        )

      ),

    );
  }
}
