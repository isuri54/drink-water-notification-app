import 'package:flutter/material.dart';
import 'package:watch_app_water/watch_screen.dart';

void main() {
  runApp(WearApp());
}

class WearApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WatchScreen(),
    );
  }
}