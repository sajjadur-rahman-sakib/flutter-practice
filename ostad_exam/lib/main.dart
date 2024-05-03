import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),

      body: Center(
        child: Column(
          children: [

            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return ClipOval(
                  child: Image.network(
                    'https://i.postimg.cc/QdhRTZK6/IMG-20230111-175746.jpg',
                    width: constraints.maxWidth * 0.4,
                    height: constraints.maxWidth * 0.4,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height/40,
            ),

            const Column(
              children: [

                Text("Sajjadur Rahman Sakib",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),

                Text("sajjadur.rahman.sakib.x@gmail.com",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),

                Padding(
                    padding: EdgeInsets.all(30),
                    child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dignissim felis sit amet odio ultricies, ac vehicula sapien gravida. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis nec risus vitae felis hendrerit tristique. Ut vestibulum ligula nec purus rutrum, nec viverra justo convallis. Nam lacinia efficitur dolor, sed sagittis leo consequat vel. Integer in leo eu arcu mattis volutpat. Maecenas vel condimentum odio. Phasellus eu diam arcu. "))

              ],
            ),


          ],
        ),
      ),

    );
  }
}
