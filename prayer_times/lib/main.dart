import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prayer_times/data.dart';

void main() {
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
    return const MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getPTData();
    super.initState();
  }
  late Data list;
  final String url = 'http://api.aladhan.com/v1/timingsByCity?city=Dhaka&country=Bangladesh&method=4';

  Future getPTData() async {
    http.Response response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    list = Data.fromJson(data);

    if (kDebugMode) {
      print(list.data.timings.asr);
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Times'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(future: getPTData(),
          builder: (context, snapshot) {
            return Center(
              child: Column(
                children: [
                  Text(list.data.timings.fajr),
                  Text(list.data.timings.dhuhr),
                  Text(list.data.timings.asr),
                  Text(list.data.timings.maghrib),
                  Text(list.data.timings.isha),
                ],
              ),
            );
          }
      )
    );
  }
}
