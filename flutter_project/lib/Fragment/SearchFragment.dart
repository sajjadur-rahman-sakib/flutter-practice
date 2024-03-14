import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFragment extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: 250,
        width: 250,
        child: Text("Sakib"),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
    );
  }
}