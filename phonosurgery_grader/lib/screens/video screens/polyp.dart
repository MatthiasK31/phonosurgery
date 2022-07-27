import 'package:flutter/material.dart';

class PolypResection extends StatelessWidget {
  const PolypResection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Polyp Resection Videos'),
          centerTitle: true,
          toolbarHeight: 75,
        ),
        /*body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
            ),
            child: const Text('Last Screen'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
          ),
        ),*/
      );
}
