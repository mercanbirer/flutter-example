import 'package:flutter/material.dart';
import 'package:flutter_example/screens/CharecterList.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Breaking Bad",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.brown,
          accentColor: Colors.amberAccent,
          secondaryHeaderColor: Colors.blueGrey,
          backgroundColor: Colors.black12),
      home: const CharecterList(),

    );
  }
}
