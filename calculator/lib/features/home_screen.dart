/*
Kevin Vega

[KGV-002] Home Screen

Reference:
Adding SVG
https://www.geeksforgeeks.org/flutter-how-to-use-svg-image/

*/

import 'package:calculator/features/calculator_screen.dart';
import 'package:calculator/features/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Home',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalculatorScreen()),
              );
            },
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              semanticsLabel: 'My SVG Image',
              height: 100,
              width: 70,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Image.asset(
              'assets/images/wefit.png',
              height: 100,
              width: 70,
            ),
          ),
          Text(
            'HELLO',
            style: TextStyle(fontFamily: 'Jokerman', fontSize: 50),
          )
        ],
      ),
    );
  }
}
