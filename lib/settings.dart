import 'package:flutter/material.dart';

import 'components/defaultItems.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

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
