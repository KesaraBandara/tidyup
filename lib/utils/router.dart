import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tidyup/pages/home_page.dart';

class Approuter {
  static final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
      ),
    ],
  );
}
