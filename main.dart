import 'dart:js';

import 'package:flutter/material.dart';
import 'package:guessit/option.dart';
import 'package:guessit/playit.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'playit',
    routes: {
      'playit': (context) => const home(),
    },
  ));
}
