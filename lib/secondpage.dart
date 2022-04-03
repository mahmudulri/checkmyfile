import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

class SecondPage extends StatefulWidget {
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
    print(data);
  }

  int _questionIndex = 0;

  nextquestion() {
    if (_questionIndex >= 3) {
      _showsnakbar(context);
    } else {
      setState(() {
        _questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Json Test Demo"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 30,
            right: 30,
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    data![_questionIndex]['question'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  nextquestion();
                },
                child: Text("Next"),
              ),
            ],
          ),
        ));
  }
}

void _showsnakbar(BuildContext context) {
  final Scaffold = ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text('Hello how are you'),
      duration: const Duration(seconds: 30),
      backgroundColor: Colors.black54,
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
