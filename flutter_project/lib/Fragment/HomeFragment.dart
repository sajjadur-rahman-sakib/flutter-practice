import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeFragment extends StatelessWidget{

  var MyItem=[
    {"img":"https://i.postimg.cc/QdhRTZK6/IMG-20230111-175746.jpg", "title":"SAKIB"},
    {"img":"https://i.postimg.cc/QdhRTZK6/IMG-20230111-175746.jpg", "title":"SAKIB"},
    {"img":"https://i.postimg.cc/QdhRTZK6/IMG-20230111-175746.jpg", "title":"SAKIB"},
    {"img":"https://i.postimg.cc/QdhRTZK6/IMG-20230111-175746.jpg", "title":"SAKIB"},
    {"img":"https://i.postimg.cc/QdhRTZK6/IMG-20230111-175746.jpg", "title":"SAKIB"},
    {"img":"https://i.postimg.cc/QdhRTZK6/IMG-20230111-175746.jpg", "title":"SAKIB"},
    {"img":"https://i.postimg.cc/QdhRTZK6/IMG-20230111-175746.jpg", "title":"SAKIB"},
    {"img":"https://i.postimg.cc/QdhRTZK6/IMG-20230111-175746.jpg", "title":"SAKIB"},
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                childAspectRatio: 1.0,
            ),
            itemCount: MyItem.length,
            itemBuilder: (context,index) {
              return GestureDetector(

                child: IconButton(onPressed: (){},
                    icon: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          width: 200,
                          height: 200,
                          child: Image.network(MyItem[index]['img']!, fit: BoxFit.fill,),
                        ),
                        const Positioned(
                          bottom: 20,
                          left: 20,
                          child: Text(
                            'Flowers',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                )
              );
            },

                            ),

          ),
          
          const Text('Hello'),

        ]
      ),
    );

  }
}