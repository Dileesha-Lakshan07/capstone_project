import 'package:flutter/material.dart';
import 'package:frontend/pages/community_page.dart';
import 'package:frontend/pages/homepage.dart';
import 'package:frontend/pages/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pet care App",
      home: HomePage(),
    );
  }
}
