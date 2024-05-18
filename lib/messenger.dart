import 'package:flutter/material.dart';
import 'dart:async';

import 'components/defaultItems.dart';

//bin momentan zu unfähig einen funktionierenden Messenger zu bauen. Deswegen sehr unvollständig...
//eigentlich soll der Messenger screen zuerst die Kontakte oder chatverläufe zeigen.

class Messenger extends StatefulWidget {
  const Messenger({super.key});

  _MessengerState createState() => _MessengerState();
}

class _MessengerState extends State<Messenger> {
  final StreamController<String> _messageStreamController =
      StreamController<String>();

  @override
  void dispose() {
    _messageStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //_buildMessageList(),
        Row(
          children: [
            Container(
              width: 300,
              height: 70,
              child: TextField(
                onSubmitted: (String value) {
                  _messageStreamController.add(value);

                  if (value == "/return") {
                    //print("returned successfully");
                    Navigator.pushNamed(context, '/homepage');
                  }
                },
              ),
            )
          ],
        ),
      ],
    ));
  }
  /*
  Widget _buildMessageList() {
    return Expanded(
        child: StreamBuilder(
            stream: _messageStreamController.stream,
            builder: (context, snapshot) {
              return ListView.builder(.....);
            }));
  }
  */
}

