import 'package:flutter/material.dart';
import 'package:healing_project/components/my_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "Waiting...";

  // void changeText(value) {
  //   setState(() {
  //     text = value;
  //   });
  //   Future.delayed(const Duration(seconds: 1), () {
  //     setState(() {
  //       text = "Waiting...";
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Mind"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: MyButton(
              id: 2,
              content: "Click me!",
              onTapValue: (value) {
                setState(() {
                  text = value;
                });
                // changeText(value);
              },
              onReset: () {
                setState(() {
                  text = "Waiting...";
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            id: 3,
            content: "Click me!",
            isCorrect: true,
            onTapValue: (value) {
              setState(() {
                text = value;
              });
            },
            onReset: () {
              setState(() {
                text = "Waiting";
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            id: 4,
            content: "Click me!",
            onTapValue: (value) {
              // changeText(value);
              setState(() {
                text = value;
              });
            },
            onReset: () {
              setState(() {
                text = "Waiting";
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            id: 5,
            content: "Click me!",
            onTapValue: (value) {
              // changeText(value);
              setState(() {
                text = value;
              });
            },
            onReset: () {
              setState(() {
                text = "Waiting";
              });
            },
          ),
        ],
      ),
    );
  }
}
