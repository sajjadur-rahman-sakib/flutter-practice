import 'dart:convert';

import 'package:data_fetch_with_model/Model/PostModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<PostModel> postList = [];

  Future<List<PostModel>> getPost() async {

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {

      for(Map i in data) {

        postList.add(PostModel.fromJson(i));

      }
      return postList;

    }
    else{
      return postList;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPost(),
              builder: (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
                  if(!snapshot.hasData){
                    return const Center(
                      child: Text("Loading..."),
                    );
                  }
                  else{
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(postList[index].id.toString()),
                              Text(postList[index].title.toString()),
                            ],
                          );
                        }
                    );
                  }
              },
            ),
          )
        ],
      ),
    );
  }
}
