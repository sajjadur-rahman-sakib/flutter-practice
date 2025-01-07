import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreService {
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Stream<QuerySnapshot> getNotes() {
    debugPrint('File Loaded');
    return notes.orderBy('note', descending: true).snapshots();
  }

  Future<void> deleteNotes(String docId) {
    debugPrint('Delete Successful');
    return notes.doc(docId).delete();
  }

  Future<void> addNote(String note) {
    debugPrint('Added Successful');
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }
}
