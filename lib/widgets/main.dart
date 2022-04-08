import 'package:flutter/material.dart';
import 'package:video_player_hook/widgets/background_video_wrapper.dart';

import 'background_video.dart';

void main() => runApp(
      const MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BackgroundVideoWrapper(
      videoPlayer: BackgroundVideo(),
      child: Center(
        child: Text(
          "Test",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
