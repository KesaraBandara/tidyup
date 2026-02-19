import 'package:flutter/material.dart';
import 'package:tidyup/utils/router.dart';
import 'package:tidyup/utils/theme_data.dart';

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
      theme: ThemeClass.darkTheme,
      routerConfig: Approuter.router,
    );
  }
}
