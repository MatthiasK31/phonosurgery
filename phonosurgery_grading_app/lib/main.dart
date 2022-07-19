import 'package:flutter/material.dart';
import './screens/homescreen.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: HomeScreen(),
      );
}
