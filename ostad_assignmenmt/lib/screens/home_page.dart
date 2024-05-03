import 'package:flutter/material.dart';
import 'package:ostad_assignmenmt/screens/animals.dart';
import 'package:ostad_assignmenmt/screens/city.dart';
import 'package:ostad_assignmenmt/screens/flowers.dart';
import 'package:ostad_assignmenmt/screens/mood.dart';
import 'package:ostad_assignmenmt/screens/asthetic.dart';
import 'package:ostad_assignmenmt/screens/road.dart';
import 'package:ostad_assignmenmt/screens/skly.dart';
import 'package:ostad_assignmenmt/screens/travel.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(12)),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.white,
                  )),
            ),
            const Text(
              "Photo Gallery",
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  size: 30,
                  color: Colors.white,
                )),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Mood()));
                      },
                      icon: Stack(
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height/5.405,
                            width: MediaQuery.sizeOf(context).width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://i.postimg.cc/XY60FT6G/2009ja-falkensteiner-bad-leonfelden-outdoor-2007.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          const Positioned(
                            bottom: 20,
                            left: 20,
                            child: Text(
                              'Mood',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 25,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Asthetic()));
                      },
                      icon: Stack(
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height/5.405,
                            width: MediaQuery.sizeOf(context).width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://i.postimg.cc/9MBgKnDM/360-F-559267615-YXJN99yia1sk-JPj-P6svww-B3d-Xu-K2-Wa-No.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          const Positioned(
                            bottom: 20,
                            left: 20,
                            child: Text(
                              'Asthetic',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Animals()));
                      },
                      icon: Stack(
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height/5.405,
                            width: MediaQuery.sizeOf(context).width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://i.postimg.cc/zXvTYcyQ/shouts-animals-watch-baby-hemingway.webp"),
                                    fit: BoxFit.cover)),
                          ),
                          const Positioned(
                            bottom: 20,
                            left: 20,
                            child: Text(
                              'Animals',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 25,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const City()));
                      },
                      icon: Stack(
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height/5.405,
                            width: MediaQuery.sizeOf(context).width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://i.postimg.cc/Pxq5vBns/cityscape-photography-2.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          const Positioned(
                            bottom: 20,
                            left: 20,
                            child: Text(
                              'City',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Travel()));
                      },
                      icon: Stack(
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height/5.405,
                            width: MediaQuery.sizeOf(context).width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://i.postimg.cc/KjScp4gF/travel-world.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          const Positioned(
                            bottom: 20,
                            left: 20,
                            child: Text(
                              'Travel',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 25,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Sky()));
                      },
                      icon: Stack(
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height/5.405,
                            width: MediaQuery.sizeOf(context).width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://i.postimg.cc/W4qvRTV4/July-night-sky-35972569256.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          const Positioned(
                            bottom: 20,
                            left: 20,
                            child: Text(
                              'Sky',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Road()));
                      },
                      icon: Stack(
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height/5.405,
                            width: MediaQuery.sizeOf(context).width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://i.postimg.cc/QChGW7TB/640px-Road-in-Norway.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          const Positioned(
                            bottom: 20,
                            left: 20,
                            child: Text(
                              'Road',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 25,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Flowers()));
                      },
                      icon: Stack(
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height/5.405,
                            width: MediaQuery.sizeOf(context).width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://i.postimg.cc/GmH0YdHj/types-of-flowers.jpg"),
                                    fit: BoxFit.cover)),
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
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

