// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Dice game"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                children: [
                  Expanded(
                      child: Image.asset('image/dice$leftDice.png')
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Image.asset('image/dice$rightDice.png')
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                ),
                  onPressed: (){
                  setState(() {
                    leftDice = Random().nextInt(6) + 1;
                    rightDice = Random().nextInt(6) + 1;
                  });
                  showToast("Left dice: {$leftDice}, Right dice: {$rightDice}");
                  },
                  child: Icon(Icons.play_arrow,
                  color: Colors.white,
                    size: 50,
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String message){
  Fluttertoast.showToast(msg: message,
  backgroundColor: Colors.white,
  textColor: Colors.black,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM
  );
}