
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/',
      routes: {
        '/' : (context) => MyHomePage(),
        '/settings' : (context) => Settings(),
        '/profile' : (context) =>  const Profile(),
      },


    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
      ),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/settings');
            }, child: const Text("Settings")),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, '/profile', arguments: {
                'name' : 'sakib',
              });
            }, child: const Text("Profile")),
          ],
        ),
      ),
    );
  }
}


class Profile extends StatelessWidget {
   
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    print(args);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: const Text("Home")),
            ElevatedButton(onPressed: (){}, child: const Text("Settings")),
          ],
        ),
      ),
    );
  }
}


class Settings extends StatelessWidget {
   Settings({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: const Text("Profile")),
            ElevatedButton(onPressed: (){}, child: const Text("Home")),
          ],
        ),
      ),
    );
  }
}
