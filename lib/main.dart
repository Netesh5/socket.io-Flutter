import 'package:chatapp/core/theme_manager/theme.dart';
import 'package:chatapp/src/presentation/homepage/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themedata,
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}
