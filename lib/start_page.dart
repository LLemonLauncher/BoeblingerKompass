import 'package:flutter/material.dart';
import 'package:boeblingerkompass/components/defaultItems.dart';

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