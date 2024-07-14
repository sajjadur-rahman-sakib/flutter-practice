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
    return GetMaterialApp(
      home: const Home(),
      initialBinding: ControllerBindings(),
    );
  }
}

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterController());
  }

}

class Home extends StatelessWidget {
  const Home({super.key});

  // final CounterController counterController = CounterController();
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
            // Obx(() {
            //   return Text("Total Count : ${counterController.count}",);
            // })

            GetBuilder<CounterController>(builder: (counterController) {
              return Text(
                "Total Count : ${counterController.count}",
              );
            }),
            TextButton(onPressed: (){
              Get.to(const Profile());
            }, child: const Text("Profile")),
            TextButton(onPressed: (){
              Get.to(const HomePage());
            }, child: const Text("Home")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Get.find<CounterController>().incrementCount,
        child: const Icon(Icons.add),
      ),
    );
  }
}


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Get.back();
          }, child: const Text("Back")),
          ElevatedButton(onPressed: (){
            Get.off(const HomePage());
          }, child: const Text("Home")),
        ],
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Get.offAll(const Home());
          }, child: const Text("Back to center")),
          ElevatedButton(onPressed: (){
            Get.to(const Profile());
          }, child: const Text("Profile")),
        ],
      ),
    );
  }
}

