import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  final CollectionReference familiarNote =
      FirebaseFirestore.instance.collection('Humans');

// 1) Create
  Future<void> addHuman(
    String name,
    String age,
    String year,
    String desciption,
    String image,
  ) {
    return familiarNote.add({
      'Name': name,
      'Age': age,
      'Year': year,
      'Desciption': desciption,
      'Image': image,
      'Timestamp': Timestamp.now(),
    });
  }

// 2) Read
  Stream<QuerySnapshot> getHuman() {
    final humanNote =
        familiarNote.orderBy('Timestamp', descending: true).snapshots();
    return humanNote;
  }

// 3) UpDate
  Future<void> upDataHumans(
    String id,
    String name,
    String age,
    String year,
    String desciption,
    String image,
  ) {
    return familiarNote.doc(id).update({
      'Name': name,
      'Age': age,
      'Year': year,
      'Desciption': desciption,
      'Image': image,
      'Timestamp': Timestamp.now(),
    });
  }

// 4) Delete
  Future<void> deleteHuman(String id) {
    return familiarNote.doc(id).delete();
  }
}
