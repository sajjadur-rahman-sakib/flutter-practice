import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home()
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Home"),
      ),

      body: Center(
        child: LinearProgressIndicator(
          minHeight: 50,
          color: Colors.red,
          backgroundColor: Colors.blue,
        ),
      )
    );
  }
}

