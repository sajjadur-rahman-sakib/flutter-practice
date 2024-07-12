import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_manage/counter_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Application"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text("Total Count : ${counterController.count}",);
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.incrementCount,
         child: const Icon(Icons.add),
      ),
    );
  }
}
