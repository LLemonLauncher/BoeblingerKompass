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
          DefaultDummySearchBar(onTap: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    MapSearchScreen(),
                transitionDuration: const Duration(seconds: 0),
              ),
            );
          }),
          
        ],
      );
  }
}