import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';

Widget card(String frontSide, String backSide, String transcription) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
    child: GestureFlipCard(
      animationDuration: const Duration(milliseconds: 300),
      axis: FlipAxis.vertical,
      enableController:
          false, // if [True] if you need flip the card using programmatically
      frontWidget: Center(
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 50, 149, 255),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              frontSide,
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
      backWidget: Center(
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 50, 149, 255),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  backSide,
                  style: const TextStyle(fontSize: 40),
                ),
                Text(
                  transcription,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
