import 'package:flutter/material.dart';

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
    
    print(MediaQuery.of(context).size);
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).orientation);
    print(MediaQuery.of(context).displayFeatures);
    print(MediaQuery.of(context).devicePixelRatio);


    print(MediaQuery.displayFeaturesOf(context) );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),

      body: OrientationBuilder(
        builder: (context, orientation) {
          if(orientation==Orientation.landscape) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.yellow,
            );
          }
          else {
              return Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.red,
              );
          }
        }
      ),



        /*
         Center(
        child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: [
              Text(MediaQuery.of(context).size.toString()),
              Text(MediaQuery.of(context).size.toString()),
              Text(MediaQuery.of(context).size.toString()),
              Text(MediaQuery.of(context).size.toString()),
              Text(MediaQuery.of(context).size.toString()),
              Text(MediaQuery.of(context).size.toString()),
              Text(MediaQuery.of(context).size.toString()),
              Text(MediaQuery.of(context).size.toString()),
              Text(MediaQuery.of(context).size.toString()),
              Text(MediaQuery.of(context).size.toString()),
              Text(MediaQuery.of(context).size.toString()),
              ]
              ),
      ),
        */

      /*
      LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth < 600) {
            return const Center(child: Text("Mobile"),
            );
          }
          else if(constraints.maxWidth < 1200) {
            return const Center(child: Text("Tablet"),
            );
          }
          else {
            return const Center(child: Text("Desktop"),
            );
          }
        }
      )
      */

    );
  }
}
