import 'package:flutter/material.dart';

class GelInjection extends StatelessWidget {
  const GelInjection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Injection Augmentation Videos'),
        centerTitle: true,
        toolbarHeight: 75,
      ),
      body: Container(
        color: Colors.blue,
        width: screenWidth,
        height: screenHeight/2,
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
}
