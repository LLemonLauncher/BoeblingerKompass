import 'package:flutter/material.dart';

import 'components/defaultItems.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
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
