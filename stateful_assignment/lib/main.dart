import 'package:flutter/cupertino.dart';
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

      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int total = 124;
  int first = 1;
  int second = 1;
  int third = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color.fromARGB(240, 255, 255, 255),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(240, 255, 255, 255),
        foregroundColor: Colors.black,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: ((MediaQuery.sizeOf(context).width)/25)),
            child: const Icon(Icons.search)
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
        
            const Row(
              children: [
                Text(
                  "My Bag",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40
                  ),
                ),
              ],
            ),
        
            const SizedBox(
              height: 30,
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 100,
              width: (MediaQuery.sizeOf(context).width),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network('https://i.postimg.cc/R0RCjb6S/Beach-2.jpg',fit: BoxFit.scaleDown,),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 45),
                            child: Text(
                              'Pullover',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              'Color: ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey

                              ),
                            ),
                            Text(
                              'Black',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            Text(
                              '     Size: ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey

                              ),
                            ),
                            Text(
                              'L',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                if(first>1) {
                                  first--;
                                  total = total - 51;
                                }
                                setState(() {});
                              },
                              icon: const Icon(CupertinoIcons.minus),
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            "$first",
                            style: const TextStyle(
                              fontSize: 18
                            ),
                          ),
                          const SizedBox(width: 5,),
                          IconButton(
                            onPressed: (){
                              total = total + 51;
                              first++;
                              setState(() {});
                              if(first==5) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Center(
                                          child: Text(
                                            "Congratulations!",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                            ),
                                          ),
                                        ),
                                        content: const Text("You Have added\n 5\n Pullover on your bag!",
                                        style: TextStyle(
                                          fontSize: 18
                                        ),),
                                        actions: [
                                          SizedBox(
                                            height: 50,
                                            width: 300,
                                            child: ElevatedButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.red),
                                              ),
                                              child: const Text("OKAY",style: TextStyle(color: Colors.white),),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                );
                              }
                            },
                            icon: const Icon(CupertinoIcons.plus),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 150, top: 5),
                        child: Icon(Icons.more_vert_outlined,color: Colors.grey,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 130),
                        child: Text(
                            "51\$",
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              height: 100,
              width: (MediaQuery.sizeOf(context).width),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network('https://i.postimg.cc/6Qw5bNQb/f39b3333282380b8c28e66d713a54fa9.png',fit: BoxFit.scaleDown,),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 55),
                            child: Text(
                              'T-Shirt',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              'Color: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey

                              ),
                            ),
                            Text(
                              'Black',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            Text(
                              '     Size: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey

                              ),
                            ),
                            Text(
                              'L',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              if(second>1) {
                                second--;
                                total = total - 30;
                              }
                              setState(() {});
                            },
                            icon: const Icon(CupertinoIcons.minus),
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            "$second",
                            style: const TextStyle(
                                fontSize: 18
                            ),
                          ),
                          const SizedBox(width: 5,),
                          IconButton(
                            onPressed: (){
                              total = total + 30;
                              second++;
                              setState(() {});
                              if(second==5) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Center(
                                          child: Text(
                                            "Congratulations!",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                            ),
                                          ),
                                        ),
                                        content: const Text("You Have added\n 5\n T-Shirt on your bag!",
                                          style: TextStyle(
                                              fontSize: 18
                                          ),),
                                        actions: [
                                          SizedBox(
                                            height: 50,
                                            width: 300,
                                            child: ElevatedButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.red),
                                              ),
                                              child: const Text("OKAY",style: TextStyle(color: Colors.white),),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                );
                              }
                            },
                            icon: const Icon(CupertinoIcons.plus),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 150, top: 5),
                        child: Icon(Icons.more_vert_outlined,color: Colors.grey,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 130),
                        child: Text(
                          "30\$",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 100,
              width: (MediaQuery.sizeOf(context).width),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network('https://i.postimg.cc/cJs0MMDV/2842fea54905e9b634f722081486e03d.jpg',fit: BoxFit.scaleDown,),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Text(
                              "Sport Dress",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              'Color: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey

                              ),
                            ),
                            Text(
                              'Black',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            Text(
                              '     Size: ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey

                              ),
                            ),
                            Text(
                              'L',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              if(third>1) {
                                third--;
                                total = total - 43;
                              }
                              setState(() {});
                            },
                            icon: const Icon(CupertinoIcons.minus),
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            "$third",
                            style: const TextStyle(
                                fontSize: 18
                            ),
                          ),
                          const SizedBox(width: 5,),
                          IconButton(
                            onPressed: (){
                              total = total + 43;
                              third++;
                              setState(() {});
                              if(third==5) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Center(
                                          child: Text(
                                            "Congratulations!",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                            ),
                                          ),
                                        ),
                                        content: const Text("You Have added\n 5\n Sport Dress on your bag!",
                                          style: TextStyle(
                                              fontSize: 18
                                          ),),
                                        actions: [
                                          SizedBox(
                                            height: 50,
                                            width: 300,
                                            child: ElevatedButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.red),
                                              ),
                                              child: const Text("OKAY",style: TextStyle(color: Colors.white),),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                );
                              }
                            },
                            icon: const Icon(CupertinoIcons.plus),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 150, top: 5),
                        child: Icon(Icons.more_vert_outlined,color: Colors.grey,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 130),
                        child: Text(
                          "43\$",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 270,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total amount: ",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15
                    ),
                  ),
                  Text(
                    "$total\$",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Congratulations!")
                        ),
                        );
                      },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                      child: const Text("CHECK OUT",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}
