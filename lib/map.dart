import 'package:flutter/material.dart';
import 'package:boeblingerkompass/components/defaultItems.dart';
import 'package:boeblingerkompass/search_screen.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {

  bool isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          // Dummysearchbar deswegen, weil ich keinen Plan hatte, wie ich den ganzen screen außer der Searchbar weiß bekomme, ohne zu viele Objekte verstecken zu müssen.
          DefaultDummySearchBar(onTap: () {
            // Deshalb ist search_screen auch eine separate Page, die ohne Transition-animation onTap hier aufgerufen wird.
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    MapSearchScreen(),
                transitionDuration: const Duration(seconds: 0),
              ),
              // auf der anderen Page ist dann eine identisch aussehende Searchbar, die dann eiene Suchfunktion hat.
              // Bitte, wer einen smarteren Weg hat das zu lösen, kann sehr gerne Vorschläge geben. Funktionieren tut es momentan aber soweit.
              // ich weiß es gibt sowas wie showSearch, aber das sieht sehr kacke aus und ich weiß nicht, wie man das designtechnisch gescheit customized. Da war ein Textfield einfacher für mich.
            );
          }),
          
        ],
      );
  }
}