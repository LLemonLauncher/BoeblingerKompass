import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final Function(String)? onSubmitted;
  final double width;
  final double height;
  DefaultTextField(
      {super.key, required this.onSubmitted, this.width = 200, this.height = 50});

  final Color borderColor = Color(0xFFE24040);
  final double borderRadius = 14.0;
  final double borderWidth = 2.2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: TextField(
          style: TextStyle(height: 1.5),
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor, width: borderWidth),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor, width: borderWidth),
            ),
          ),
        ));
  }
}

class DefaultSlickTextField extends StatelessWidget {
  final Function(String)? onSubmitted;
  final double width;
  final double height;
  final String hintText;
  final bool obscureText;
  DefaultSlickTextField(
      {super.key,
      required this.onSubmitted,
      this.width = 200,
      this.height = 50,
      required this.hintText,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: TextField(
          onSubmitted: onSubmitted,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hintText,
          ),
        ));
  }
}

class DefaultTextButton extends StatelessWidget {
  final dynamic Function() onPressed;
  final String text;
  DefaultTextButton({super.key, required this.onPressed, required this.text});

  final Color colorNotPressed = Color.fromARGB(255, 71, 233, 233);
  final Color colorOnPressed = Color.fromARGB(255, 0, 255, 255);

  final Color textColorNormal = Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return colorOnPressed;
          }
          return colorNotPressed;
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return colorOnPressed; // Set custom ripple color here
          }
          return colorNotPressed;
        }),
        foregroundColor: MaterialStateProperty.all(textColorNormal),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class DefaultSearchBar extends StatelessWidget {
  final dynamic Function() onTap;
  final dynamic Function(dynamic) onChanged;
  final dynamic focusNode;
  DefaultSearchBar(
      {super.key,
      required this.onTap,
      required this.onChanged,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Color.fromARGB(255, 63, 57, 57);
    final double borderRadius = 30.0;
    final double borderWidth = 1.2;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: TextField(
        focusNode: focusNode,
        onTap: onTap,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
          prefixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.search,
              size: 20,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
        ),
      ),
    );
  }
}

class DefaultDummySearchBar extends StatelessWidget {
  final dynamic Function() onTap;
  DefaultDummySearchBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Color.fromARGB(255, 63, 57, 57);
    final double borderRadius = 30.0;
    final double borderWidth = 1.2;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: TextField(
        onTap: onTap,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
          prefixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.search,
              size: 20,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
        ),
      ),
    );
  }
}

class DefaultR2LTransition extends PageRouteBuilder {
  final Widget page;

  DefaultR2LTransition({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}

class DefaultL2RTransition extends PageRouteBuilder {
  final Widget page;

  DefaultL2RTransition({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}