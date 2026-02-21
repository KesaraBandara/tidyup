import 'package:flutter/material.dart';
import 'package:tidyup/utils/text_styles.dart';
import 'package:tidyup/widget/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tidyup", 
        style: AppTextStyles.appTitle)),
        body: Padding(padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ProgressCard(
              completedTasks: 5, 
              totalTasks: 10,
            ),
          ],
        ),),);
  }
}
