import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 25),
            child: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 250),
              child: Text(
                "My Bag",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  buildItem('Pullover',
                      'https://i.postimg.cc/R0RCjb6S/Beach-2.jpg', 51),
                  buildItem(
                      'T-Shirt',
                      'https://i.postimg.cc/6Qw5bNQb/f39b3333282380b8c28e66d713a54fa9.png',
                      30),
                  buildItem(
                    'Sport Dress',
                    'https://i.postimg.cc/cJs0MMDV/2842fea54905e9b634f722081486e03d.jpg',
                    43,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total amount: ",
                    style: TextStyle(color: Colors.black45, fontSize: 15),
                  ),
                  Text(
                    "$total\$",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Congratulations!")));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  "CHECK OUT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String title, String imageUrl, int price) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Text(
                        'Color: ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        'Black',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '     Size: ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        'L',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (title == 'Pullover') {
                              if (first > 1) {
                                first--;
                                total -= price;
                              }
                            } else if (title == 'T-Shirt') {
                              if (second > 1) {
                                second--;
                                total -= price;
                              }
                            } else if (title == 'Sport Dress') {
                              if (third > 1) {
                                third--;
                                total -= price;
                              }
                            }
                          });
                        },
                        icon: const Icon(CupertinoIcons.minus),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        title == 'Pullover'
                            ? '$first'
                            : title == 'T-Shirt'
                                ? '$second'
                                : '$third',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (title == 'Pullover') {
                              total += price;
                              first++;
                              if (first == 5) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return buildDialog('Pullover');
                                  },
                                );
                              }
                            } else if (title == 'T-Shirt') {
                              total += price;
                              second++;
                              if (second == 5) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return buildDialog('T-Shirt');
                                  },
                                );
                              }
                            } else if (title == 'Sport Dress') {
                              total += price;
                              third++;
                              if (third == 5) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return buildDialog('Sport Dress');
                                  },
                                );
                              }
                            }
                          });
                        },
                        icon: const Icon(CupertinoIcons.plus),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(Icons.more_vert_outlined, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10),
                child: Text(
                  "$price\$",
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildDialog(String item) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Congratulations!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      content: Text(
        "                 You Have added\n                               5\n              $item on your bag!",
        style: const TextStyle(fontSize: 18),
      ),
      actions: [
        SizedBox(
          height: 50,
          width: 300,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text(
              "OKAY",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
