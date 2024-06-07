import 'package:flutter/material.dart';
import 'package:frontend/signUp.dart';
import 'login.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "my app",
      home: signUp(),
    );
  }
}

