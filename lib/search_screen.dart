import 'package:boeblingerkompass/components/defaultItems.dart';
import 'package:boeblingerkompass/main.dart';
import 'package:flutter/material.dart';

//momentan ist eine vorgegebene Suchliste drin. In Zukunft soll hier natürlich von den Datenank abgerufen werden
//momentan funktioniert die Suche auch nur, wenn man etwas eingibt und die Eingabe wieder löscht. Sollte man sich dann anschauen, wenn das Backend soweit ist.
//Da die Karte ja nicht funktioniert, wird ein Klick auf ein Suchergebnis einen nur auf die homepage weiterleiten (mit Kartenicon selected)

class MapSearchScreen extends StatefulWidget {
  const MapSearchScreen({super.key});
  @override
  _MapSearchScreenState createState() => _MapSearchScreenState();
}

class _MapSearchScreenState extends State<MapSearchScreen> {
  List<String> searchTerms = [
    'Fußballplatz Bussardstraße',
    'Sportplatz Eichendorffschule',
    'Bärenkino',
    'Kaktus Spezialitätenkaffee',
    'Café Emil',
    'FrechDax'
  ];

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  List<String> filteredSearchTerms = [];

  @override
  Widget build(BuildContext context) {
    //now think about how the hell you want to organize the search screen in general
    return Material(
      child: Column(
        children: [
          DefaultSearchBar(
              focusNode: _focusNode,
              onTap: () {},
              onChanged: (value) {
                //print(value);
                if (value != null) {
                  setState(() {
                    filteredSearchTerms = searchTerms
                        .where((term) => term.contains(value))
                        .toList();
                    filteredSearchTerms.sort((a, b) => a.compareTo(b));
                  });
                }


                //nur temporär: Screen switcher in der Search bar möglich um leichter zu navigieren

                if (value == "/return") {
                  //print("returned successfully");

                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          HomePage(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                }
                if(value == "/home") {Navigator.pushNamed(context, '/homepage');}
                if(value == "/login") {Navigator.pushNamed(context, '/loginpage');}
                //if(value == "/register") {Navigator.pushNamed(context, '/registerpage');}
                //if(value == "/settings") {Navigator.pushNamed(context, '/settingspage');}
                //if(value == "/messenger") {Navigator.pushNamed(context, '/messenger');}




              }),
          ListView.builder(
            shrinkWrap: true,
            itemCount: filteredSearchTerms.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  //print("text has been tapped on");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(filteredSearchTerms[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
