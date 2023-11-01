import 'dart:async';

import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final int id;
  final String? content;
  final bool isCorrect;
  Function(String)? onTapValue;
  VoidCallback? onReset;

  MyButton({
    super.key,
    required this.id,
    this.content = "",
    this.isCorrect = false,
    this.onTapValue,
    this.onReset,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> with TickerProviderStateMixin {
  bool isPlay = false;
  String text = "";

  Future<void> changeColor() async {
    setState(() {
      isPlay = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isPlay = false;
        if (widget.onReset != null) {
          widget.onReset!();
        }
      });
    });
  }

  String changeText(text) {
    text = widget.isCorrect ? "Correct" : "False";
    return text;
  }

  @override
  Widget build(BuildContext context) {
    Color currentColor = Colors.amber;
    Color tempColor = Colors.red;
    return InkWell(
      onTap: () async {
        changeColor();
        if (widget.onTapValue != null) {
          widget.onTapValue!(changeText(text));
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 50,
        decoration: BoxDecoration(
          color: isPlay
              ? (widget.isCorrect ? Colors.green : tempColor)
              : currentColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Center(
          child: Text(
            widget.content!,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
