import 'dart:ui';
import 'package:boeblingerkompass/components/defaultItems.dart';
import 'package:flutter/material.dart';

// Backend ist noch nicht fertig. Deswegen funktioniert bei Email und Password nichts. Muss noch ausgebaut werden
// Außerdem braucht es auch einee wetierleitung auf eine Register Page (noch nicht existent)
// um rauszukommen einfach in das Passwortfeld reingehen und enter drücken.

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
            decoration: const BoxDecoration(
              //Das Bild ist aus dem Internet, vlt sollten wir unser eigenes machen. Zu finden in root/assets
                image: DecorationImage(
              image: AssetImage('boeblingen.jpg'),
              fit: BoxFit.cover,
            )),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Stack(
                    children: [
                      //weißer Außenrand (Macht Text besser lesbar)
                      Text(
                        "Willkommen zurück!",
                        style: TextStyle(
                          fontSize: 40,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1
                            ..color = Colors.grey, // Outline color
                        ),
                      ),
                      // Inner filled text
                      BackdropFilter(
                        //slightly blurs image to make text more readable
                        filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                        child: Container(
                          color: Colors.transparent,
                          child: const Text(
                            "Willkommen zurück!",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.black, // Inner text color
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 150),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: DefaultSlickTextField(
                        width: double.infinity,
                        hintText: "Email",
                        onSubmitted: (String value) {
                          //print(value);
                          if (value == "email@boeblingen.de") {
                            //print("login successful");
                            Navigator.pushNamed(context, '/homepage');
                          }
                        }),
                  ),
                  const SizedBox(height: 15),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: DefaultSlickTextField(
                        obscureText: true,
                        width: double.infinity,
                        hintText: "Passwort",
                        onSubmitted: (String value) {
                          //print(value);
                          Navigator.pushNamed(context, '/homepage');
                        }),
                  )
                ]))));
  }
}
