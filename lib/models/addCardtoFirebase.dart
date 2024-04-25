import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void addCardToFirebase(
    TextEditingController frontSideController,
    TextEditingController backSideController,
    TextEditingController transcriptionController) {
  CollectionReference collRef =
      FirebaseFirestore.instance.collection('FlipCards');
  collRef.add({
    'FrontSide': frontSideController.text,
    'BackSide': backSideController.text,
    'Transcription': transcriptionController.text
  });

  frontSideController.clear();
  backSideController.clear();
  transcriptionController.clear();
}
