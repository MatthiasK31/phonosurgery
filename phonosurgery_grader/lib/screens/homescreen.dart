import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
          backgroundColor: Color.fromARGB(255, 255, 242, 205),
          appBar: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            title: const Text('PhonoGrader'),
            shadowColor: Colors.black,
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 50,
            ),
            toolbarHeight: 75,
          ),
          body: Container(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 2,
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
                    child: const Text('Gel Injection'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GelInjection()));
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
                    child: const Text('Keratosis Removal'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KeratosisRemoval()));
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
                    child: const Text('Polyp Removal'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PolypRemoval()));
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
                    child: const Text('Deep Ressection'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeepRessection()));
                    },
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
