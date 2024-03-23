import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'UserModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  List<UserModel> userList = [];

  
  Future<List<UserModel>> getUser() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    
    if (response.statusCode == 200) {
      
      for(Map i in data) {
        userList.add(UserModel.fromJson(i));

      }
      return userList;
    } 
    else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUser(),
                builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {

                  if(!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(

                      ),
                    );
                  }
                  else{
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text("Name: "),
                                    Text(snapshot.data![index].name.toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("User: "),
                                    Text(snapshot.data![index].username.toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("Email: "),
                                    Text(snapshot.data![index].email.toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("City: "),
                                    Text(snapshot.data![index].address!.city.toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("GEO: "),
                                    Text(snapshot.data![index].address!.geo!.lat.toString()),
                                  ],
                                ),
                              ],
                            ),
                          )
                        );
                      },
                    );
                  }
                },

              )
          )
        ],
      )
    );
  }
}
