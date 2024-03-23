import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

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

  List<Photos> photoList = [];

  Future<List<Photos>> getPhotos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode==200) {
      for(Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);

        photoList.add(photos);
      }
      return photoList;
    }
    else {
      return photoList;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),

      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: photoList.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data![index].title.toString(),
                        ),
                        ),
                        title: Text(snapshot.data![index].title.toString()),
                        subtitle: Text(snapshot.data![index].id.toString()),
                      );
                    },
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}

class Photos {

  String title,url;

  int id;

  Photos({required this.title,required this.url,required this.id});

}