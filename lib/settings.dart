import 'package:flutter/material.dart';

import 'components/defaultItems.dart';

// sehr unvollständig. Leitet einen Momentan nur auf die Startpage weiter.
// weiß nicht ob wir in Zukunft das Settingsmenü hier haben wollen. Ich glaub in einem Drawermenu eäre es wahrscheinlich besser.

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
