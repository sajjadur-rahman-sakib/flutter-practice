import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Asthetic extends StatelessWidget {
  const Asthetic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,

        title: (Text("Asthetic",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25
          ),)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 30,
                color: Colors.white,
              )),
        ],
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: MediaQuery.sizeOf(context).height/3,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://i.postimg.cc/9MBgKnDM/360-F-559267615-YXJN99yia1sk-JPj-P6svww-B3d-Xu-K2-Wa-No.jpg"),
                        fit: BoxFit.cover)
                ),
              ),

            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height/100,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 180),
              child: Text("Astheic With Mind ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height/100,
            ),

            Container(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: const Column(
                children: [
                  Text("Aesthetic refers to the appreciation of beauty or the principles underlying the creation and appreciation of beauty.",
                    style: TextStyle(
                      fontSize: 15,
                    ),),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height/30,
            ),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    fixedSize: Size(MediaQuery.sizeOf(context).width/1.1, MediaQuery.sizeOf(context).height/20,)
                ),
                onPressed: (){},
                child: const Text("See More")
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height/35,
            ),
            Container(
              padding: EdgeInsets.only(right: 270),
              child: Text("Suggestions",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20
                ),),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://i.postimg.cc/9MBgKnDM/360-F-559267615-YXJN99yia1sk-JPj-P6svww-B3d-Xu-K2-Wa-No.jpg"),
                              fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width/20,
                    ),

                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          color:Colors.greenAccent,
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://i.postimg.cc/zXvTYcyQ/shouts-animals-watch-baby-hemingway.webp"),
                              fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width/20,
                    ),
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          color:Colors.greenAccent,
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://i.postimg.cc/Pxq5vBns/cityscape-photography-2.jpg"),
                              fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width/20,
                    ),
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          color:Colors.greenAccent,
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://i.postimg.cc/KjScp4gF/travel-world.jpg"),
                              fit: BoxFit.cover)
                      ),
                    ),

                  ],
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
