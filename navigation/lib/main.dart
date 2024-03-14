import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Navigation("This is from home to navigation")));
            }, child: Text("Navigation")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Activity("This is from home to Activity")));
            }, child: Text("Activity"))
          ],
        ),
      ),
    );
  }
}

class Navigation extends StatelessWidget {

  String msg;

  Navigation(
      this.msg,
      {super.key}

      );



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(msg),
      ),
      body: Container(
        height: 250,
        width: 250,
        color: Colors.blue,

      ),
    );
  }
}

class Activity extends StatelessWidget {

  String msg;
  Activity(
      this.msg,
      {super.key}
      );


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(msg),
      ),

    );
  }
}
