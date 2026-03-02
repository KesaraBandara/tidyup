import 'package:flutter/material.dart';
import 'package:tidyup/models/todo_model.dart';

class CompletedTab extends StatefulWidget {
  final List<Todo> completeToDos;
  const CompletedTab({super.key, required this.completeToDos});

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Completed Tab"),
    );
  }
}