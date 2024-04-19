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
      body: ListView(
        children: <Widget>[
          card('Elephant', 'Слон', 'Элефан'),
          card('Phone', 'Телефон', 'фон'),
          card('Laptop', 'Ноутбук', 'лэптоп'),
        ],
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
