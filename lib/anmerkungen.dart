import 'package:flutter/material.dart';

import 'components/defaultItems.dart';

// sehr unvollständig. Leitet einen Momentan nur auf die Startpage weiter.
// Ich weiß nicht mal, ob ich diesen screen überhaupt in der BottomNacigationBar haben möchte. Ist eher was für ein Drawermenu oder Untermenu.
// Für das erste ist es aber ein guter Platzhalter

class Anmerkungen extends StatefulWidget {
  const Anmerkungen({Key? key}) : super(key: key);

  @override
  State<Anmerkungen> createState() => _AnmerkungenState();
}

class _AnmerkungenState extends State<Anmerkungen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/startpage');
        },
        text: "go to startpage",
      ),
    );
  }
}
