import 'dart:async';

import 'package:boeblingerkompass/components/defaultItems.dart';

import 'package:boeblingerkompass/messenger.dart';
import 'package:boeblingerkompass/calendar.dart';
import 'package:boeblingerkompass/map.dart';
import 'package:boeblingerkompass/anmerkungen.dart';
import 'package:boeblingerkompass/settings.dart';

import 'package:boeblingerkompass/start_page.dart';
import 'package:boeblingerkompass/login_page.dart';
import 'package:boeblingerkompass/search_screen.dart';
import 'package:boeblingerkompass/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/startpage': (context) => const StartPage(),
        '/loginpage': (context) => const LoginPage(),
        '/homepage': (context) => HomePage(),
        '/search': (context) => const MapSearchScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: HomePage(),
    ),
  );
}

Function debounce(Function function, int delay) {
  Timer? timer;
  return () {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: delay), function());
  };
}

bool isLoggedIn = true;

//if(isLoggedIn) {
//  Navigator.push(context, MaterialPageRoute(builder: (context) => const StartPage()));
// }

class HomePage extends StatefulWidget {
  //const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int barindex = 2;
  bool canChangeIndex = true;
  //barindex = 2 heißt, dass die Karte zuerst angezeigt wird (weil der Index der Karte in der Bottomnavigationbar 2 ist)
  //canChangeIndex ist dafür da, dass dass nicht mehr als ein Menü geswiped

  List<Widget> pages = [
    const Text("Chat"),
    const Text("Event"),
    const Text("Map"),
    const Text("Feedback"),
    const Text("Settings"),
  ];

  
  @override
  Widget build(BuildContext context) {
    // Cooldown period in milliseconds

    //if (barindex == 0) {
    //  Navigator.push(context, DefaultL2RTransition(page: Messenger()));}

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        //print("index changable again");
        canChangeIndex = true;
      },
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! > 0 && barindex > 0 && canChangeIndex) {
          //print("swiped left"); print(barindex - 1);
          setState(() {
            barindex--;
            canChangeIndex = false;
          });
        } else if (details.primaryDelta! < 0 &&
            barindex < pages.length - 1 &&
            canChangeIndex) {
          //print("swiped right"); print(barindex + 1);
          setState(() {
            barindex++;
            canChangeIndex = false;
          });
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: barindex,
          children: const [
            //messenger gets its seperate screen in the future
            Messenger(),
            Calendar(),
            Map(),
            Anmerkungen(),
            Settings(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                barindex = index;
              });
            },
            currentIndex: barindex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'CivaChat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.feedback),
                label: 'Anmerkungen',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              )
            ]),
      ),
    );
  }
}
