import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tidyup/models/note_model.dart';
import 'package:tidyup/pages/create_new_note.dart';
import 'package:tidyup/pages/home_page.dart';
import 'package:tidyup/pages/notes_by_category.dart';
import 'package:tidyup/pages/notes_page.dart';
import 'package:tidyup/pages/single_note.dart';
import 'package:tidyup/pages/todo_page.dart';
import 'package:tidyup/pages/update_note_page.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: true,
    initialLocation: "/",
    routes: [
      GoRoute(
        name: "home",
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        name: "notes",
        path: '/notes',
        builder: (context, state) {
          return const NotesPage();
        },
      ),
      GoRoute(
        name: "todos",
        path: '/todos',
        builder: (context, state) {
          return const TodoPage();
        },
      ),
      //notes by category
      GoRoute(
        name: "category",
        path: "/category",
        builder: (context, state) {
          final String category = state.extra as String;
          return NoteByCategory(category: category);
        },
      ),

      GoRoute(
        name: "create-note",
        path: "/create-note",
        builder: (context, state) {
          final isNewCategory = state.extra as bool;

          return CreateNotePage(isNewCategory: isNewCategory);
        },
      ),
      GoRoute(
        name: "edit-note", // Corrected route name
        path: "/edit-note", // Corrected path with parameter
        builder: (context, state) {
          final Note note = state.extra as Note;
          return UpdateNotePage(note: note);
        },
      ),

      GoRoute(
        name: "single-note", // Corrected route name
        path: "/single-note", // Corrected path with parameter
        builder: (context, state) {
          final Note note = state.extra as Note;
          return SingleNotePage(note: note);
        },
      ),
    ],
  );
}
