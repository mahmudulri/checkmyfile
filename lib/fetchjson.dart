import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

class Jsonfetch extends StatefulWidget {
  _JsonfetchState createState() => _JsonfetchState();
}

class _JsonfetchState extends State<Jsonfetch> {
  List? data;
  Future<String?> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/questions.json');

    setState(() {
      data = json.decode(jsonText);
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Json Test"),
        ),
        body: ListView.builder(
          itemCount: data == null ? 0 : data!.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                  title: Text(data![index]['question']),
                ),
              ],
            );
          },
        ));
  }
}
