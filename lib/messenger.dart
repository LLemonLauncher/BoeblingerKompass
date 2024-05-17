import 'package:flutter/material.dart';
import 'dart:async';

import 'components/defaultItems.dart';

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
        _buildMessageList(),
        DefaultTextField(
          width: 300,
          height: 70,
          onSubmitted: (String value) {
            _messageStreamController.add(value);

            if(value == "/return") {
              print("returned successfully");
              Navigator.pushNamed(context, '/homepage');
            }
          },
        ),
      ],
    ));
  }

  Widget _buildMessageList() {
    return Expanded(
      child: StreamBuilder(
        stream: _messageStreamController.stream,
        builder: (context, snapshot) {
          return ListView(
            children: [
              if (snapshot.hasData) Expanded(child: Text(snapshot.data.toString())),
            ],
          );
        }),
        );
  }
}
