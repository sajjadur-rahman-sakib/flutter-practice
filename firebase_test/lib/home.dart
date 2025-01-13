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
  final TextEditingController imageUrlTEController = TextEditingController();
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
              controller: imageUrlTEController,
            ),
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
                  firestoreService.addNote(imageUrlTEController.text, nameTEController.text,
                      ageTEController.text, locationTEController.text);
                } else {
                  firestoreService.updateNote(docId, imageUrlTEController.text, nameTEController.text,
                      ageTEController.text, locationTEController.text);
                }
                Navigator.pop(context);
                imageUrlTEController.clear();
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
          // Show a loading indicator while the snapshot is loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Check if there's an error
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong!"),
            );
          }

          // Check if the snapshot has data
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No data available."),
            );
          }

          // Display the data
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
                  title: Row(
                    children: [
                      Text(data['name'] ?? "No Name"),
                      const SizedBox(width: 10),
                      Image.network(
                        data['image'] ?? "https://i.postimg.cc/3J3sgfbC/profile-pic-2.png",
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(data['age'] ?? "No Age"),
                      Text(data['location'] ?? "No Location"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () => openNoteBox(docId: docId),
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () => firestoreService.deleteNotes(docId),
                          icon: const Icon(Icons.delete)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      )

    );
  }
}
