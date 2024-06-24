import 'package:flutter/material.dart';
import 'package:frontend/pages/Community_page.dart';
import 'package:frontend/pages/homepage.dart';
import 'package:frontend/pages/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pet care App",
      home: CommunityPage(),
    );
  }
}
