import 'package:flutter/material.dart';
import 'package:tidyup/models/todo_model.dart';
import 'package:tidyup/widget/todo_card.dart';

class TodoTab extends StatefulWidget {
  final List<Todo> inCompleteToDos;
  const TodoTab({super.key, required this.inCompleteToDos});

  @override
  State<TodoTab> createState() => _TodoTabState();
}

class _TodoTabState extends State<TodoTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: widget.inCompleteToDos.length,
              itemBuilder: (context, index) {
                final Todo todo = widget.inCompleteToDos[index];
                return TodoCard(toDo: todo, isComplete: false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
