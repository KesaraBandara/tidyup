import 'package:flutter/material.dart';
import 'package:tidyup/models/todo_model.dart';
import 'package:tidyup/services/todo_service.dart';
import 'package:tidyup/utils/colors.dart';
import 'package:tidyup/utils/text_styles.dart';
import 'package:tidyup/widget/completed_tab.dart';
import 'package:tidyup/widget/todo_tab.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage>
    with SingleTickerProviderStateMixin {
        late List<Todo> allToDos = [];
  late List<Todo> inCompleteToDos = [];
  late List<Todo> completeToDos = [];
  late TabController _tabController;
  TodoService toDoService = TodoService();

   @override

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _checkIfUserIsNew();
  }

    void _checkIfUserIsNew() async {
    final bool isNewUser = await toDoService.isNewUser();

    if (isNewUser) {
      await toDoService.createInitialTodos();
    }
    _loadToDos();
  }

    Future<void> _loadToDos() async {
    final List<Todo> loadedToDos = await toDoService.loadTodos();

    setState(() {
      allToDos = loadedToDos;
      inCompleteToDos = allToDos.where((todo) => !todo.isDone).toList();
      completeToDos = allToDos.where((todo) => todo.isDone).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(child: Text("Todo", style: AppTextStyles.appDescription)),
            Tab(child: Text("Completed", style: AppTextStyles.appDescription)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          side: BorderSide(color: AppColors.kWhiteColor, width: 2),
        ),
        child: Icon(Icons.add, color: AppColors.kWhiteColor, size: 30,),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
        TodoTab(inCompleteToDos: inCompleteToDos), 
        CompletedTab( completeToDos: completeToDos)],
      ),
    );
  }
}
