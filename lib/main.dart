import 'package:flutter/material.dart';
import 'package:tidyup/pages/home_page.dart';
import 'package:tidyup/utils/router.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "tidyup",
      debugShowCheckedModeBanner: false,
      routerConfig: Approuter.router,
    );
  }
}
