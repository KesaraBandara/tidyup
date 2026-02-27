import 'package:flutter/material.dart';
import 'package:tidyup/models/note_model.dart';

class UpdateNotePage extends StatefulWidget {

  final Note note;
  const UpdateNotePage({super.key, required this.note});

  @override
  State<UpdateNotePage> createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Update Note"),
      ),
    );
  }
}