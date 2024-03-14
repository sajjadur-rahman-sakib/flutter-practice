import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmailFragment extends StatefulWidget{

  @override
  State<EmailFragment> createState() => _EmailFragmentState();
}

class _EmailFragmentState extends State<EmailFragment> {
  var data='no data';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
    );
  }
}
