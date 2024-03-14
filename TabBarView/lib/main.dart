import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tabbarview/Fragment/EmailFragment.dart';
import 'package:tabbarview/Fragment/HomeFragment.dart';
import 'package:tabbarview/Fragment/SearchFragment.dart';
import 'package:tabbarview/Fragment/SettingsFragment.dart';


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
        home: HomeActivity()
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});



  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 8,

        child:  Scaffold(

          appBar: AppBar(
            title: const Text("MyApp"),
            titleSpacing: 0,
            centerTitle: true,
            toolbarHeight: 60,
            toolbarOpacity: 1,
            elevation: 0,

            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home',),
                Tab(icon: Icon(Icons.search), text: 'Search',),
                Tab(icon: Icon(Icons.settings), text: 'Settings',),
                Tab(icon: Icon(Icons.email), text: 'Email',)
              ],
            ),
          ),




          body: TabBarView(
            children: [
              HomeFragment(),
              SearchFragment(),
              SettingsFragment(),
              EmailFragment(),

            ],
          )
        )
    );
  }
}
