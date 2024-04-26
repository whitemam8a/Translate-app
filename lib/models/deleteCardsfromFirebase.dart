import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteAllDocuments() async {
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('FlipCards');
  QuerySnapshot querySnapshot = await collectionRef.get();
  querySnapshot.docs.forEach((doc) {
    doc.reference.delete();
  });
}
