import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 0.8,
            child: Container(
              color: Colors.red,
            ),
            )
        ],
      ),
      
      
      
      
      
      
      
      
      
      
      
      
      // body: Column(
      //   children: [
      //     SizedBox(
      //       width: MediaQuery.of(context).size.width,
      //       height: 800,
      //       child: FractionallySizedBox(
      //         heightFactor: 1,
      //         widthFactor: 1,
      //         child: Container(
      //           color: Colors.red,
      //         ),
      //       ),
      //     )
      //   ],
      // ),



      // body: Column(
      //   children: [
      //     Flexible(
      //       flex: 3,
      //       fit: FlexFit.tight,
      //       child: Container(
      //         color: Colors.red
      //       ),
      //     ),
      //     Expanded(
      //       flex: 2,
      //       child: Container(
      //         color: Colors.green,
      //       ),
      //     ),
      //     Expanded(
      //       flex: 5,
      //       child: Container(
      //           color: Colors.yellow,
      //           height: 100,
      //           width: double.infinity,
      //         ),
      //     ),
      //   ],
      // )

    );
  }
}
