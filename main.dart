import 'package:flutter/material.dart';
import 'package:hazora/question.dart';
import 'App.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

App ap = new App();
void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text(
            "test",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        // ignore: prefer_const_constructors
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: const hazora(),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class hazora extends StatefulWidget {
  const hazora({super.key});

  @override
  State<hazora> createState() => _hazoraState();
}

// ignore: camel_case_types
int rightanswer = 0;

class _hazoraState extends State<hazora> {
  Question question1 =
      Question('is the number of plant 8', 'images/image-4.jpg', true);
  List<bool> cheak = [true, true, false, false];

  List<Padding> m = [];

  void addlist(bool t) {
    bool s = ap.getqn();
    setState(() {
      if (t == s) {
        rightanswer++;
        // ignore: avoid_print
        m.add(const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        m.add(const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }
      if (ap.chekend() == true) {
        ap.reset();
        m.removeRange(0, m.length);
        Alert(
          context: context,
          type: AlertType.success,
          title: "THE END",
          desc: "You have $rightanswer correct",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              child: const Text(
                "Try Agin",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        rightanswer = 0;
      } else {
        ap.ch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: m,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(ap.getqi()),
              const SizedBox(
                height: 20,
              ),
              Text(
                ap.getqt(),
                style: const TextStyle(color: Colors.blue, fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.green),
              onPressed: () {
                setState(() {
                  Image.asset(ap.getqi());
                  addlist(true);
                });
              },
              child: const Text('YES'),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  Image.asset(ap.getqi());
                  addlist(false);
                });
              },
              child: const Text('NO'),
            ),
          ),
        ),
      ],
    );
  }
}
