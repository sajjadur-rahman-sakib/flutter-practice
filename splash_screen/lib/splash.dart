import 'package:flutter/material.dart';

import 'home.dart';
import 'main.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 1500), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'SAKIB',)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Splash Screen",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
