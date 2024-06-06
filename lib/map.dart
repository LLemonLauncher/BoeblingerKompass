import 'package:flutter/material.dart';
import 'package:boeblingerkompass/components/defaultItems.dart';
import 'package:boeblingerkompass/search_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
          DefaultDummySearchBar(toScreen: MapSearchScreen(), hintText: "Suche Orte",),
          Expanded(
            child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(48.685014, 9.009687),
                  initialZoom: 17.2,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
  markers: [
    Marker(
      point: LatLng(48.685014, 9.009687),
      width: 80,
      height: 80,
      child: Icon(Icons.discord),
    ),
  ],
),
                ],
              ),
          )
            // Deshalb ist search_screen auch eine separate Page, die ohne Transition-animation onTap hier aufgerufen wird.
            // auf der anderen Page ist dann eine identisch aussehende Searchbar, die dann eiene Suchfunktion hat.
            // Bitte, wer einen smarteren Weg hat das zu lösen, kann sehr gerne Vorschläge geben. Funktionieren tut es momentan aber soweit.
            // ich weiß es gibt sowas wie showSearch/Showsearchdelegate, aber das sieht sehr kacke. Da schien  mir diese Lösung einfacher.
            
          
          
        ],
      );
  }
}