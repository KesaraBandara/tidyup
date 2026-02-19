import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tidyup/pages/home_page.dart';

class Approuter {
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
    ],
  );
}
