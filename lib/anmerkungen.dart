import 'package:flutter/material.dart';

import 'components/defaultItems.dart';

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
