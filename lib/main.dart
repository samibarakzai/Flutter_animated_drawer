import 'package:flutter/material.dart';
import 'day11/animated_drawer_home.dart';
import 'day11/simple_drawer.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "flutter demo",
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: AnimatedDrawerHome(),
    );

  }
}
