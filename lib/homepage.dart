import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _questionIndex = 0;

  nextquestion() {
    if (_questionIndex >= _questions.length - 1) {
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
        title: Text("Fetch Data"),
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
                  _questions[_questionIndex]['question'],
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
      ),
    );
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

List _questions = [
  {'question': 'How long is New Zealand weather'},
  {'question': 'How long is Bangladesh weather'},
  {'question': 'How long is Pakistan weather'},
  {'question': 'How long is Inida weather'}
];
