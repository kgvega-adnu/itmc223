/*
Kevin Vega

[KGV-001] Calculator Screen
Creating a calculator app

Reference:
Calculator feature
https://www.geeksforgeeks.org/simple-calculator-app-using-flutter/
*/

import 'package:calculator/features/home_screen.dart';
import 'package:calculator/features/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  //variable declaration
  var userInput = '';
  var answer = '';
  final List<String> buttons = [
    'C',
    '^',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Back')),
          const SizedBox(
            height: 50,
          ),
          //user input
          Text(userInput,
              style: const TextStyle(fontSize: 30, color: Colors.white)),

          //answer
          Text(answer,
              style: const TextStyle(fontSize: 50, color: Colors.white)),
          //buttons
          Expanded(
              child: GridView.builder(
            itemCount: buttons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (BuildContext context, int index) {
              //clear button
              if (index == 0) {
                return MyButton(
                  buttonText: buttons[index],
                  buttonTapped: () {
                    setState(() {
                      userInput = '';
                      answer = '';
                    });
                  },
                );
              }
              if (index == 1) {
                return MyButton(
                  buttonText: buttons[index],
                  buttonTapped: () {
                    setState(() {
                      userInput += buttons[index];
                    });
                  },
                );
              }
              if (index == 2) {
                return MyButton(
                  buttonText: buttons[index],
                  buttonTapped: () {
                    setState(() {
                      userInput += buttons[index];
                    });
                  },
                );
              }
              //delete button
              if (index == 3) {
                return MyButton(
                  buttonColor: Colors.orange,
                  textColor: Colors.white,
                  buttonText: buttons[index],
                  buttonTapped: () {
                    setState(() {
                      userInput = userInput.substring(0, userInput.length - 1);
                    });
                  },
                );
              } else if (index == 18) {
                //equal button
                return MyButton(
                  buttonText: buttons[index],
                  buttonTapped: () {
                    setState(() {
                      equalPressed();
                    });
                  },
                  buttonColor: Colors.orange,
                  textColor: Colors.white,
                );
              }
              //all other buttons
              else {
                return MyButton(
                  buttonColor: isOperator(buttons[index])
                      ? Colors.orange
                      : Colors.white12,
                  textColor: Colors.white,
                  buttonText: buttons[index],
                  buttonTapped: () {
                    setState(() {
                      userInput += buttons[index];
                    });
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }

  isOperator(String button) {
    if (button == 'x' || button == '/' || button == '-' || button == '+') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalUserInput = userInput;

    finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);

    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);

    answer = eval.toString();
  }
}
