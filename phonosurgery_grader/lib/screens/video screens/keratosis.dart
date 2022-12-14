import 'package:flutter/material.dart';
import 'package:phonosurgery_grader/screens/interfaces/playergrader.dart';

class KeratosisResection extends StatelessWidget {
  const KeratosisResection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 68, 68, 68),
        appBar: AppBar(
          title: const Text('Keratosis Resection Videos'),
          centerTitle: true,
          toolbarHeight: 75,
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
            ),
            child: const Text('Video 1'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlayAndGrade(),
                  ));
            },
          ),
        ),
      );
}
