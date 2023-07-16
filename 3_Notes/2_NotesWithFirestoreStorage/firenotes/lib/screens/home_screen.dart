import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firenotes/screens/note_editor.dart';
import 'package:firenotes/screens/note_reader.dart';
import 'package:firenotes/styles/app_style.dart';
import 'package:firenotes/widgets/note_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("FireNotes"),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            Text("Your Recent Notes", 
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22
              ),
            ),
            const SizedBox(height: 20,),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context,AsyncSnapshot snapshot){
                   // checking connection
                   if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                   }
                   if(snapshot.hasData){
                    return GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                      ),
                      children: snapshot.data!.docs
                       .map<Widget>((note)=> noteCard((){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> NoteReaderScreen(note),
                        )
                        );
                       }, note))
                       .toList() , 
                    );                  
                   }
                   return Text(
                    "There are no notes",
                     style: GoogleFonts.nunito(
                      color:  Colors.white
                     ),
                    );
                  },
                ),
            )

          ]
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context)=> const NoteEditorScreen()));
        }, 
        label: const Text("Add Note"),
        icon: const Icon(Icons.add)
        ),        
    );
  }
}