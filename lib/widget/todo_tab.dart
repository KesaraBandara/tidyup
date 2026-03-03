import 'package:flutter/material.dart';
import 'package:tidyup/helpers/snackbar.dart';
import 'package:tidyup/models/todo_model.dart';
import 'package:tidyup/services/todo_service.dart';
import 'package:tidyup/utils/router.dart';
import 'package:tidyup/widget/todo_card.dart';

class TodoTab extends StatefulWidget {
  final List<Todo> inCompleteToDos;
  const TodoTab({super.key, required this.inCompleteToDos});

  @override
  State<TodoTab> createState() => _TodoTabState();
}

class _TodoTabState extends State<TodoTab> {
  //handle mark as done
  void _markAsDone(Todo toDo) async {
    try {
      print(toDo);
      //updated todo
      final Todo updatedToDo = Todo(
        id: toDo.id,
        title: toDo.title,
        date: toDo.date,
        time: toDo.time,
        isDone: true,
      );
      //call the service to mark as done
      await TodoService().markAsDone(updatedToDo);

      //show snackbar
      AppHelpers.showSnackBar(context, "Marked as Done");
      setState(() {
        widget.inCompleteToDos.remove(toDo);
      });
      AppRouter.router.go("/todos");
    } catch (e) {
      print(e);
      //show snackbar
      AppHelpers.showSnackBar(context, "Failed to mark as Done");
    }
  }

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
                return TodoCard(toDo: todo, isComplete: false,
                 onCheckBoxChanged: () => _markAsDone(todo),
                 );
              },
            ),
          ),
        ],
      ),
    );
  }
}
