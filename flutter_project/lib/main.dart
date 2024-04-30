import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'Fragment/EmailFragment.dart';
import 'Fragment/HomeFragment.dart';
import 'Fragment/SearchFragment.dart';
import 'Fragment/SettingsFragment.dart';
import 'Screen/home.dart';
import 'Screen/profile.dart';

main() {
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => const MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(primarySwatch: Colors.green),
        darkTheme: ThemeData(primarySwatch: Colors.amber),
        color: Colors.blue,
        debugShowCheckedModeBanner: false,
        home: HomeActivity()
    );
  }
}

class HomeActivity extends StatefulWidget {
  HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  MySnackBar(message, context) {

    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

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

    return DefaultTabController(
        length: 8,

    child:  Scaffold(

      appBar: AppBar(
        title: Text("MyApp"),
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(onPressed: (){MySnackBar("Comments", context);}, icon: Icon(Icons.comment),),
          IconButton(onPressed: (){MySnackBar("Search", context);}, icon: Icon(Icons.search),),
          IconButton(onPressed: (){MySnackBar("Settings", context);}, icon: Icon(Icons.settings),),
          IconButton(onPressed: (){MySnackBar("Email", context);}, icon: Icon(Icons.email),)
        ],
        bottom: TabBar(
          isScrollable: true,
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home',),
            Tab(icon: Icon(Icons.search), text: 'Search',),
            Tab(icon: Icon(Icons.settings), text: 'Settings',),
            Tab(icon: Icon(Icons.email), text: 'Email',),
            Tab(icon: Icon(Icons.contact_mail),),
            Tab(icon: Icon(Icons.person),),
            Tab(icon: Icon(Icons.access_alarm),),
            Tab(icon: Icon(Icons.wallet),),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        elevation: 10,
        child: Icon(Icons.add),
        onPressed: () {
          MySnackBar("Floating Action Button", context);
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Contact")
        ],
        onTap: (int index) {
          if(index==0){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
           // ElevatedButton(onPressed: (){
             // Navigator.push(context, MaterialPageRoute(builder: (context)=>Navigation()));
            //}, child: Text("Navigation"));
          }
          if(index==1){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
          }
          if(index==2){
            MySnackBar("Contact Bottom Menu", context);
          }
        },
      ),

      drawer: Drawer(

        child: ListView(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                currentAccountPicture: Image.asset('assets/Untitled-1.jpg'),
                accountName: const Text("Sajjadur Rahman Sakib"),
                accountEmail: Text("sakib.x@icloud.com"),

                onDetailsPressed: (){MySnackBar("This is Profile", context);},
              )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){MySnackBar("Home", context);},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: (){MySnackBar("Home", context);},
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Contact"),
              onTap: (){MySnackBar("Home", context);},
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              onTap: (){MySnackBar("Home", context);},
            ),
          ],
        ),
      ),

      endDrawer: Drawer(

        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blueGrey),
                  accountName: Text("Sajjadur Rahman Sakib"),
                  accountEmail: Text("sakib.x@icloud.com"),
                  currentAccountPicture: Image.network("https://i.postimg.cc/QdhRTZK6/IMG-20230111-175746.jpg"),
                  onDetailsPressed: (){MySnackBar("This is Profile", context);},
                )
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: (){MySnackBar("Home", context);},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: (){MySnackBar("Home", context);},
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Contact"),
              onTap: (){MySnackBar("Home", context);},
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              onTap: (){MySnackBar("Home", context);},
            ),
          ],
        ),
      ),

      body: TabBarView(
        children: [
          HomeFragment(),
          SearchFragment(),
          SettingsFragment(),
          EmailFragment(),
        ],
      )

      /*GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            childAspectRatio: 1.0
        ),
        itemCount: MyItem.length,
        itemBuilder: (context,index) {
          return GestureDetector(
            onTap: (){MySnackBar(MyItem[index]['title'], context);},
            onDoubleTap: (){MySnackBar("Double Tap Working", context);},
            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              child: Image.network(MyItem[index]['img']!, fit: BoxFit.fill,),
            ),
          );
        },

      ),*/

    )
    );
  }
}
