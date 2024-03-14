import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class SettingsFragment extends StatefulWidget{

  @override
  State<SettingsFragment> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  var url='https://jsonplaceholder.typicode.com/posts';
  bool isLoading=true;
  var data='no data';
  
  void getData() async {
    http.Response response = await http.get(Uri.parse(url));
    
    setState(() {
      data = response.body;
      isLoading=false;
    });
  }
  
  @override
  void initState() {
    super.initState();
    print('Init State Called');
    getData();
    print(data.runtimeType);
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        print("Pressed");
              
                        http.Response response = await http.get(
                            Uri.parse('https://jsonplaceholder.typicode.com/posts'));
                        setState(() {
                          data = response.body;
                        });
                      },
                      child:  Text('load data')
              
                  ),
                  Text(data),
                ],
              ),
            ),
      
        ),
      ),
    );
  }
}