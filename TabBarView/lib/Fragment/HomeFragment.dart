import 'package:flutter/cupertino.dart';

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

    return
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            childAspectRatio: 1.0
        ),
        itemCount: MyItem.length,
        itemBuilder: (context,index) {
          return GestureDetector(

            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              child: Image.network(MyItem[index]['img']!, fit: BoxFit.fill,),
            ),
          );
        },

      );

  }
}