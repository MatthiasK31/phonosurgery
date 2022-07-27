import 'package:flutter/material.dart';
import 'package:phonosurgery_grader/screens/video%20screens/deep.dart';
import 'package:phonosurgery_grader/screens/video%20screens/keratosis.dart';
import 'package:phonosurgery_grader/screens/video%20screens/polyp.dart';
import './video screens/gelinjection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 68, 68, 68),
          appBar: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            title: const Text('PhonoGrader'),
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
            toolbarHeight: 75,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                childAspectRatio: 2.125,
              ),
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 35),
                      padding: const EdgeInsets.all(20),
                      primary: Colors.redAccent.withOpacity(0.1),
                    ),
                    child: const Text('Injection Augmentation'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GelInjection()));
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 35),
                      padding: const EdgeInsets.all(20),
                      primary: Colors.blueAccent.withOpacity(0.1),
                    ),
                    child: const Text('Keratosis Resection'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const KeratosisResection()));
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 35),
                      padding: const EdgeInsets.all(20),
                      primary: Colors.yellowAccent.withOpacity(0.1),
                    ),
                    child: const Text('Polyp Resection'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PolypResection()));
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 35),
                      padding: const EdgeInsets.all(20),
                      primary: Colors.greenAccent.withOpacity(0.1),
                    ),
                    child: const Text('Deep Vocal Fold Resection'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DeepResection()));
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
