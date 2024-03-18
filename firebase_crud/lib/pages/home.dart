
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //firestore service
  final FirestoreService firestoreService = FirestoreService();

  final TextEditingController textController = TextEditingController();
  //open a dialog box to add a new note
  void openNoteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: textController,
          ),
          actions: [
            ElevatedButton(onPressed: (){
              if(docID == null){
                //add new note
                firestoreService.addNote(textController.text);
              } else {
                //update note
                firestoreService.updateNote(docID, textController.text);
              }

              //clear text controller
              textController.clear();

              //close the box
              Navigator.pop(context);
            },
                child: const Text("Add Note")),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List notesList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                //get each individual docs
                DocumentSnapshot document = notesList[index];
                String docID = document.id;


                //get notes from each doc
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;

                String noteText = data['note'];

                //display as a list title

                return Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 10, right: 5),

                  child: ListTile(
                    title: Text(noteText),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //update button
                        IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () => openNoteBox(docID: docID),
                        ),

                        //delete button
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => firestoreService.deleteNotes(docID)
                        ),
                      ],
                    )
                  ),
                );
              }
            );
          }
          // if no data
          else {
            return const Text("No data found!");
          }
        },
      ),
    );
  }
}
