import 'package:flutter/material.dart';
import 'package:tidyup/models/note_model.dart';
import 'package:tidyup/services/note_service.dart';

class NoteByCategory extends StatefulWidget {
  final String category;
  const NoteByCategory({super.key, required this.category});

  @override
  State<NoteByCategory> createState() => _NoteByCategoryState();
}

class _NoteByCategoryState extends State<NoteByCategory> {

  List<Note> noteList = [];
  void initState(){
    super.initState();
    _loadCategoriesNotes();
  }

  // load all notes by category
     Future<void> _loadCategoriesNotes() async {
    final noteService = NoteService();
    noteList = await noteService.getNotesByCategory(widget.category);
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}