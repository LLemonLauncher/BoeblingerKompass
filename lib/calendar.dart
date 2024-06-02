import 'package:boeblingerkompass/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'components/defaultItems.dart';

// hier sollen in Zukunft alle events und Sitzungen angezeigt werden.
// Beispiele: Events am Elbenplatz wie Foodtruck oder Flohmarkt, Bürgerrundführungen, Gemeinderatssitzungen und solche Geschichten
//Bis jetzt wird der Kalender nur angezeit, man kann aber noch keine Events hinzufügen

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        
        children: [
          DefaultDummySearchBar( toScreen: MapSearchScreen(), hintText: "Suche Events",),
          Container(
            
            child: TableCalendar(focusedDay: DateTime.now(), firstDay: DateTime.utc(2024, 1, 1), lastDay: DateTime.utc(2030, 12, 31))),
        ],
      ),
    );
  }
}
