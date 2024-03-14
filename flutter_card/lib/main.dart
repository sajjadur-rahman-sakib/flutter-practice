import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


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
        title: const Text("Home"),
      ),
      
      body:  Center(
        
          child: Card(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            shadowColor: Colors.greenAccent,
            color: Colors.grey,
            elevation: 30,

            child: SizedBox(
              height: 200,
              width: 200,
              child: Center(child: Text('This is Card'),),
            ),
          ),
      ),
    );

  }
}
