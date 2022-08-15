import 'package:phonosurgery_grader/widgets/videoplayer.dart';
import 'package:video_player/video_player.dart';
import '/widgets/likerttable.dart';
import 'package:flutter/material.dart';

class PlayAndGrade extends StatelessWidget {
  const PlayAndGrade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player and Likert Scale'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        shadowColor: Colors.black,
      ),
      body: Row(
        children: [
          Container(
            height: screenHeight,
            width: (screenWidth / 2) - 6.25,
            margin: const EdgeInsets.only(right: 5),
            child: Vid(
              /* //videoPlayerController: VideoPlayerController.asset('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
              videoPlayerController: VideoPlayerController.asset('video/one punch.mov'),
              looping: true, */
            ),
          ),
          const VerticalDivider(
            color: Colors.black,
            thickness: 2.5,
            width: 2.5,
            indent: 0,
            endIndent: 0,
          ),
          Container(
            height: screenHeight,
            width: (screenWidth / 2) - 6.25,
            margin: const EdgeInsets.only(left: 5),
            child: TableView(),
          ),
        ],
      ),
    );
  }
}
