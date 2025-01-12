import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreService {
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Stream<QuerySnapshot> getNotes() {
    debugPrint('Fetching notes from Firestore...');
    return notes.orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> deleteNotes(String docId) {
    debugPrint('Delete Successful');
    return notes.doc(docId).delete();
  }

  Future<void> addNote(String name, String age, String location) {
    debugPrint('Added Successful');
    return notes.add({
      'name': name,
      'age': age,
      'location': location,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> updateNote(String docID, String name, String age, String location) {
    return notes.doc(docID).update({
      'name': name,
      'age': age,
      'location': location,
      'timestamp': Timestamp.now(),
    });
  }
}
