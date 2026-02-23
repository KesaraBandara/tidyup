import 'package:flutter/material.dart';
import 'package:tidyup/utils/constants.dart';
import 'package:tidyup/utils/router.dart';
import 'package:tidyup/utils/text_styles.dart';
import 'package:tidyup/widget/notes_todo_card.dart';
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
      appBar: AppBar(title: Text("Tidyup", style: AppTextStyles.appTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: AppConstants.kDefaultPadding),
            ProgressCard(completedTasks: 5, totalTasks: 10),
            SizedBox(height: AppConstants.kDefaultPadding * 1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    AppRouter.router.push("/notes");
                  },
                  child: NotesTodoCard(
                    title: "Notes",
                    description: "",
                    icon: Icons.bookmark_add_outlined,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AppRouter.router.push("/todos");
                  },
                  child: NotesTodoCard(
                    title: "TO-DO List",
                    description: "",
                    icon: Icons.today_outlined,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstants.kDefaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today's progress", style: AppTextStyles.appSubtitle),
                Text("See All", style: AppTextStyles.appButton),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
