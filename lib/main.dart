import 'package:flutter/material.dart';
import 'package:tidyup/pages/home_page.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "tidyup",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
