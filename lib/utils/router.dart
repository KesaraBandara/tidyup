import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tidyup/pages/home_page.dart';
import 'package:tidyup/pages/notes_page.dart';
import 'package:tidyup/pages/todo_page.dart';

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
    ],
  );
}
