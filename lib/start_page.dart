import 'package:flutter/material.dart';
import 'package:boeblingerkompass/components/defaultItems.dart';

// Ausbaufähig, funktioniert aber. Außerdem wäre eine direkte Register Route gar nicht schlecht auf der rechten Seite.
// Wobei die Register page noch nicht existiert. aber der Rest schon.
// in Zukundt soll diese Page on first startup angezeigt werden.
class StartPage extends StatelessWidget {
  const StartPage({super.key});
 
 @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          DefaultTextButton(onPressed: () {Navigator.pushNamed(context, '/homepage');}, text: "Ohne Login fortfahren"),
          
          const FractionallySizedBox(
            heightFactor: 0.8, 
            child: VerticalDivider(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            DefaultTextButton(onPressed: () {Navigator.pushNamed(context, '/loginpage');}, text: "Mit Login fortfahren"),
            ]
          
          )
        ],),
      )
    );
  }
}