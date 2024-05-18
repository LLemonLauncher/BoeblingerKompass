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

// Die "import 'package:boeblingerkompass/components/defaultItems.dart';" ist ziemlich wichtig für alle anderen Screens um Designelemente zu bekommen.
// Damit wir das Design einheitlich und cohärent gestalten können, kommen in die defaultitems Datei alle Widgets rein, die wiederverwendet werden.
// Sowas wie DefaultTextButton oder DefaultTextField sind da drin und da sollten auch zukünftige rein. Alle Widgets sollten auch immer das Präfix "Default" haben
// 
//
//
//
//
//

void main() {
  runApp(
    MaterialApp(
      routes: {
        // in so ziemlich jedem textfeld momentan kann man /return eingeben um im zweifelsfall zurück zur startpage zu kommen
        // ansonsten code snippet einbauen --> Navigator.pushNamed(context, '/Pagename'); 
        // vvvvvvvv hier werden die Pages definiert
        '/startpage': (context) => const StartPage(),
        '/loginpage': (context) => const LoginPage(),
        '/homepage': (context) => HomePage(),
        '/search': (context) => const MapSearchScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      // In Zukunft soll es drei Modi, aka. Themes geben: lightMode, darkMode und eine bunte Darstellung
      // lightMode soll quasi das einfache, slicke MinimalDesign sein.
      // darkmode ist glaub ich selbsterklärend
      // und der Farbige mode soll Designtechnisch ansprechend sein und Schlüsselfarben beinhalten, die wiedererkennungswert haben.
      // Beispielsweise gibt es Color(0xFFE24040), welches das Rot des Böblinger Wappens immitieren sollte, Grün für die Bäume in BB und blau für den See z.B.
      // inspiriert durch die App des Kulturpasses (die ist vom künstlierischem Design her ziemlich gut, kann man sich mal anschauen)
      
      home: HomePage(),
    ),
  );
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
  //canChangeIndex ist dafür da, dass dass nicht mehr als ein Menü auf einmal swipen kann (Aufgrund des GestureDetectors)

  List<Widget> pages = [
    const Text("Chat"),
    const Text("Event"),
    const Text("Map"),
    const Text("Feedback"),
    const Text("Settings"),
  ];

  
  @override
  Widget build(BuildContext context) {

    //wahrscheinlich ist es nicht ultra clean einen gestureDetecor als erstes zu returnen. Kann in Zukunft natürlich geändert werden, aber gerade funktionierts.
    //GestureDetector: Damit man die pages swipen kann
    return GestureDetector(
      
      onHorizontalDragEnd: (details) {
        //print("index changable again");
        canChangeIndex = true;
      },
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! > 2 && barindex > 0 && canChangeIndex) {
          //print("swiped left"); print(barindex - 1);
          setState(() {
            barindex--;
            canChangeIndex = false;
          });
        } else if (details.primaryDelta! < -2 && barindex < pages.length - 1 &&canChangeIndex) {
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
            // zuerst sollen die Kontakte / Chatverläufe angezeigt werden
            // onclick sollte dann ein neuer screen geöffnet werden (ohne bottomnavigationbar)
            //Messenger muss allgemein nochmal komplett neu gedacht werden
            Messenger(),
            Calendar(),
            Map(),
            Anmerkungen(),
            Settings(),
            // Settings kann auch ein Drawer Menu sein. Die Anzahl der Pages kann durchaus noch geädnert werden.
            // 5 Items erscheinen mir sowieso zu viel.
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
