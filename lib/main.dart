import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tidyup/models/note_model.dart';
import 'package:tidyup/models/todo_model.dart';
import 'package:tidyup/utils/router.dart';
import 'package:tidyup/utils/theme_data.dart';

void main() async {

  // initialize hive
  await Hive.initFlutter();

  //registering adapters
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(TodoAdapter());

  //open box
  await Hive.openBox("notes");
  await Hive.openBox("todos");

  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "tidyup",
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.darkTheme.copyWith(
        textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
