import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:translator/Widgets/Widget_Card.dart';

class VocabularyWords extends StatelessWidget {
  const VocabularyWords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 72, 143, 250),
        title: const Center(child: Text('Cards')),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('FlipCards').snapshots(),
        builder: (context, snapshot) {
          List<Widget> cardsWidgets = [];
          if (snapshot.hasData) {
            final cards = snapshot.data?.docs.reversed.toList();
            for (var card in cards!) {
              final cardWidget = widgetCard(
                  card['FrontSide'], card['BackSide'], card['Transcription']);
              cardsWidgets.add(cardWidget);
            }
          }
          return Expanded(
            child: ListView(
              children: cardsWidgets.reversed.toList(),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add new '),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/');
              // Navigator.of(context).pushNamed('/');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/addCard');
              // Navigator.of(context).pushNamed('/addCard');
              break;
          }
        },
      ),
    );
  }
}
