import 'package:flutter/material.dart';
import 'package:quiz_app/model_class.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: quizapp()));
}

class quizapp extends StatefulWidget {
  const quizapp({Key? key}) : super(key: key);

  @override
  State<quizapp> createState() => _quizappState();
}

class _quizappState extends State<quizapp> {
  // List<String> l1 = [
  //   "There are 4 lungs in the human body",
  //   "The human skin regenerates once in two weeks.",
  //   "The speed of the average human sneeze can be measured up to 100 miles an hour.",
  //   "Humans lose an an average of 75 strands of hair per week",
  //   "The number of bones in an infant is more than that of an average human.",
  //   "The liver is the largest internal organ in the human body."
  // ];
  // List l2 = [false, false, true, false, true, true];

  List l = [
    quiz(q: 'There are 4 lungs in the human body', a: false),
    quiz(q: 'The human skin regenerates once in two weeks.', a: false),
    quiz(
        q: 'The speed of the average human sneeze can be measured up to 100 miles an hour.',
        a: true),
    quiz(
        q: 'Humans lose an an average of 75 strands of hair per week',
        a: false),
    quiz(
        q: 'The number of bones in an infant is more than that of an average human.',
        a: true),
    quiz(
        q: 'The liver is the largest internal organ in the human body.',
        a: true),
  ];

  List<Icon> l3 = [];

  int i = 0;

  void qc() {
    if (i < l.length) {
      i++;
    }
  }

  String question() {
    return l[i].q;
  }

  bool ans() {
    return l[i].a;
  }

  bool finish() {
    if (i >= l.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int reset() {
    i = 0;
    return i;
  }

  void bc(bool b) {
    bool a = ans();
    setState(() {
      if (finish() == true) {
        Alert(
            context: context,
            title: "Completed",
          buttons: [
          DialogButton(
            child: Text(
              "Start New",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],)
            .show();

        reset();
        l3 = [];
      } else {
        if (b == a) {
          l3.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          l3.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        qc();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              question(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w800),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    bc(true);
                  },
                  highlightColor: Colors.red,
                  child: Card(
                    elevation: 4,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: Text(
                          "True",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    bc(false);
                  },
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return Colors.redAccent;
                    return null;
                  }),
                  child: Card(
                    elevation: 4,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: Text(
                          "False",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: l3,
        ),
      ),
    );
  }
}
