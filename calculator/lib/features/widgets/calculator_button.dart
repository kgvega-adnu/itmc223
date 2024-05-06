import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final String buttonText;
  final Function()? buttonTapped;

  const MyButton(
      {super.key,
      this.buttonColor = Colors.white,
      this.textColor = Colors.black,
      required this.buttonText,
      this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: buttonColor,
            child: Center(
              child: Text(buttonText,
                  style: TextStyle(color: textColor, fontSize: 30)),
            ),
          ),
        ),
      ),
    );
  }
}
