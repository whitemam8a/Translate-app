// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:translator/Widgets/Widget_TextField.dart';
import 'package:translator/models/addCardtoFirebase.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController frontSideController = TextEditingController();
  final TextEditingController backSideController = TextEditingController();
  final TextEditingController transcriptionController = TextEditingController();

  // @override
  // void dispose() {
  //   myController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 72, 143, 250),
        title: const Center(child: Text('Add Cards')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20.0),
        reverse: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const Text('Front of the card'),
              callTextField('Введите иностранное слово', frontSideController),
              // TextField(
              //   controller: wordController,
              //   decoration: const InputDecoration(
              //     contentPadding:
              //         EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(10.0))),
              //     hintText: 'Введите иностранное слово',
              //     fillColor: Color.fromARGB(145, 116, 229, 244),
              //     filled: true,
              //   ),
              // ),
              const SizedBox(
                height: 30.0,
              ),
              const Text('Back of the card'),
              callTextField('Введите перевод', backSideController),
              // TextField(
              //   controller: translationController,
              //   decoration: const InputDecoration(
              //     border: InputBorder.none,
              //     hintText: 'Введите перевод',
              //     fillColor: Colors.grey,
              //     filled: true,
              //   ),
              // ),
              const SizedBox(
                height: 30.0,
              ),
              const Text('Trascription'),
              callTextField(
                  "Введите транскрипцию слова", transcriptionController),
              // TextField(
              //   controller: transcriptionController,
              //   decoration: const InputDecoration(
              //     border: InputBorder.none,
              //     hintText: 'Введите транскрипцию слова',
              //     fillColor: Colors.grey,
              //     filled: true,
              //   ),
              // ),
              const SizedBox(
                height: 50.0,
              ),
              Container(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    addCardToFirebase(frontSideController, backSideController,
                        transcriptionController);
                    // CollectionReference collRef =
                    //     FirebaseFirestore.instance.collection('FlipCards');
                    // collRef.add({
                    //   'FrontSide': frontSideController.text,
                    //   'BackSide': backSideController.text,
                    //   'Transcription': transcriptionController.text
                    // });

                    // frontSideController.clear();
                    // backSideController.clear();
                    // transcriptionController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Make a new card",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
