import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_example/models/Character.dart';
import 'package:flutter_example/models/Character.dart';

class CharecterListScreen extends StatefulWidget {
  const CharecterListScreen({Key? key}) : super(key: key);

  @override
  _CharectersState createState() => _CharectersState();
}

class _CharectersState extends State<CharecterListScreen> {
  List<Character> characterArray = <Character>[];

  void getCharacters() async {
    String url = 'https://www.breakingbadapi.com/api/characters';
    http.Response res = await http.get(Uri.parse(url));
    print(res.body);

    var data = await jsonDecode(res.body);
    print(data[0]['name']);

    setState(() {
      for (var i = 0; i < data.length; i++) {
        Character c = Character();
        c.id = data[i]['char_id'];
        c.ad = data[i]['name'];
        c.img = data[i]['img'];

        characterArray.add(c);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking Bad'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).backgroundColor,
                  Theme.of(context).scaffoldBackgroundColor
                ],
                tileMode: TileMode.mirror)),
        child: ListView.builder(
            itemCount: characterArray.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  characterArray[index].ad,
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 20.0),
                ),leading: CircleAvatar(
                backgroundImage: NetworkImage(characterArray[index].img),
              ),
              );
            }),
      ),
    );
  }
}
