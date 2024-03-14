import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        darkTheme: ThemeData(primarySwatch: Colors.amber),
        color: Colors.blue,
        debugShowCheckedModeBanner: false,
        home: const HomeActivity()
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});


  @override
  Widget build(BuildContext context) {

    ButtonStyle buttonStyle=ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 60)
    );

    return Scaffold(

        appBar: AppBar(
          title: const Text("MyApp"),
        ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.all(20), child: TextField(decoration: InputDecoration(labelText: 'First Name', border: OutlineInputBorder(),),),),
        const Padding(padding: EdgeInsets.all(20), child: TextField(decoration: InputDecoration(labelText: 'Last Name', border: OutlineInputBorder(),),),),
        const Padding(padding: EdgeInsets.all(20), child: TextField(decoration: InputDecoration(labelText: 'Email Address', border: OutlineInputBorder(),),),),
        Padding(padding: const EdgeInsets.all(20), child: ElevatedButton(onPressed: (){},style: buttonStyle,child: const Text("Submit"),)),
      ],
    ),
    );
  }
}
