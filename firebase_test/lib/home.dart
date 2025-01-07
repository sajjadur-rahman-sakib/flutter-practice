import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textEditingController = TextEditingController();

  void openNoteBox({String? docId}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textEditingController,
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                if (docId == null) {
                  firestoreService.addNote(textEditingController.text);
                } else {
                  firestoreService.updateNote(
                      docId, textEditingController.text);
                }
                Navigator.pop(context);
                textEditingController.clear();
              },
              child: const Text("Text"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Firestore"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List noteList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = noteList[index];
                String docId = documentSnapshot.id;

                Map<String, dynamic> data =
                    documentSnapshot.data() as Map<String, dynamic>;

                String noteText = data['note'];

                return Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(noteText),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () => openNoteBox(docId: docId),
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () =>
                                firestoreService.deleteNotes(docId),
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
