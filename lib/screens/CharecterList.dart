import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_example/models/Character.dart';
import 'package:flutter_example/models/Character.dart';


class CharecterList extends StatefulWidget {
  const CharecterList({Key? key}) : super(key: key);

  @override
  _CharectersState createState() => _CharectersState();
}

class _CharectersState extends State<CharecterList> {

  void getCharacters() async {

    Uri myUri = Uri.parse("https://www.breakingbadapi.com/api/characters");
    Response res =  await get(myUri);
    if (kDebugMode) {
      print(res);
    }

    var data = await jsonDecode(res.body);
    if (kDebugMode) {
      print(data[0]['name']);
    }

    for(var i= 0; i < data.length ; i++){
      Character c = Character();

    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking Bad'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            getCharacters();
          },
          child: const Text("Get Characters"),
        ),
      ),
    );
  }
}
