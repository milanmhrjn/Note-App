import 'package:flutter/material.dart';
import 'package:note_app/note.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'notes',
    debugShowCheckedModeBanner: false,
    routes: {
      'notes': (context) {
        return HomeScreen();
      }
    },
  ));
}
