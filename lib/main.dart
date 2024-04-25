import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:translator/firebase_options.dart';
import 'package:translator/screens/add_Card.dart';
import 'package:translator/screens/vocabulary_words.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Translator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 59, 200, 243)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const VocabularyWords(),
        '/addCard': (context) => const AddCard(),
      },
      // home: VocabularyWords(),
    );
  }
}
