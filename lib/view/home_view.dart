import 'package:ehsbha/view/widgets/my_buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var userQuestion = '';
  var userAnswer = '';
  List<String> myList = [
    'C',
    'D',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade700,
      body: Column(
        children: [
          // output
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 100,
              ),
              //user question
              Container(
                margin: const EdgeInsets.only(left: 15),
                alignment: Alignment.topLeft,
                child: Text(
                  userQuestion,
                  
                  style: const TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 1.5),
                ),
              ),
              //user answer
              Container(
                margin: const EdgeInsets.only(right: 15, bottom: 20),
                alignment: Alignment.bottomRight,
                child: Text(
                  userAnswer,
                  style: const TextStyle(color: Colors.white,fontSize: 22),
                ),
              )
            ],
          )),
          //operation
          Expanded(
            flex: 2,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: myList.length,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: MyButtons(
                    myPadding: isDot(myList[i]) ? 20 : 0,
                    fontSize: isMinus(myList[i])
                        ? 50
                        : isDot(myList[i])
                            ? 40
                            : 22,
                    text: myList[i],
                    bgColor: Colors.red.shade700,
                    textColor: isOperator(myList[i])
                        ? Colors.black
                        : isC(myList[i])
                            ? Colors.black
                            : isDEL(myList[i])
                                ? Colors.black
                                : Colors.white,
                    onTap: () {
                      //user output
                      setState(() {
                        if (myList[i] == 'D' ||
                            myList[i] == 'C' ||
                            myList[i] == '=') {
                        } else {
                          userQuestion += myList[i];
                        }
                      });
                      //Delete
                      if (myList[i] == 'D') {
                        setState(() {
                          userQuestion =
                              userQuestion.substring(0, userQuestion.length - 1);
                        });
                      }
                      //Clear
                      if (myList[i] == 'C') {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        });
                      }
                      //Result
                      if (myList[i] == '=') {
                        setState(() {
                          myResult();
                        });
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // functions
  bool isOperator(x) {
    if (x == '%' || x == '/' || x == 'X' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  bool isC(x) {
    if (x == 'C') {
      return true;
    } else {
      return false;
    }
  }

  bool isDEL(x) {
    if (x == 'D') {
      return true;
    } else {
      return false;
    }
  }

  bool isDot(x) {
    if (x == '.') {
      return true;
    } else {
      return false;
    }
  }

  bool isMinus(x) {
    if (x == '-') {
      return true;
    } else {
      return false;
    }
  }

  void myResult() {
    var myQ = userQuestion;
    myQ = myQ.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(myQ);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
