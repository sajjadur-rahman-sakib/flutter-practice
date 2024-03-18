import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  //get the collection notes
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  //CREATE and add new notes
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }
  //READ and get notes
  Stream<QuerySnapshot> getNotesStream() {
    return notes.orderBy('timestamp', descending: true).snapshots();
  }

  //Update and edit notes
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  //DELETE notes
  Future<void> deleteNotes(String docID) {
    return notes.doc(docID).delete();
  }
}
