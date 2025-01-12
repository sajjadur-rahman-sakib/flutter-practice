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
  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController ageTEController = TextEditingController();
  final TextEditingController locationTEController = TextEditingController();

  void openNoteBox({String? docId}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          children: [
            TextField(
              controller: nameTEController,
            ),
            TextField(
              controller: ageTEController,
            ),
            TextField(
              controller: locationTEController,
            ),
          ],
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                if (docId == null) {
                  firestoreService.addNote(nameTEController.text,
                      ageTEController.text, locationTEController.text);
                } else {
                  firestoreService.updateNote(docId, nameTEController.text,
                      ageTEController.text, locationTEController.text);
                }
                Navigator.pop(context);
                nameTEController.clear();
                ageTEController.clear();
                locationTEController.clear();
              },
              child: const Text("Submit"))
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
          if (!snapshot.hasData) {
            List<DocumentSnapshot> noteList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = noteList[index];
                String docId = documentSnapshot.id;

                Map<String, dynamic> data =
                    documentSnapshot.data() as Map<String, dynamic>;

                return Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(data['name']),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(data['age']),
                        Text(data['location']),
                      ],
                    ),
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
