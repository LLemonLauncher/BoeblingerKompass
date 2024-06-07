import 'package:flutter/material.dart';

// In Zukunft soll es drei Modi, aka. Themes geben: lightMode, darkMode und eine bunte Darstellung

// lightMode soll quasi das einfache, slicke MinimalDesign sein.
// darkmode ist glaub ich selbsterklärend
// und der Farbige mode soll Designtechnisch ansprechend sein und Schlüsselfarben beinhalten, die wiedererkennungswert haben.
// Beispielsweise gibt es Color(0xFFE24040), welches das Rot des Böblinger Wappens immitieren sollte, Grün für die Bäume in BB und blau für den See z.B.
// bisschen inspiriert durch die App des Kulturpasses (die ist vom künstlierischem Design her ziemlich gut, kann man sich mal anschauen)

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900

  )
);