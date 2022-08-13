import 'package:flutter/material.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      );
}
