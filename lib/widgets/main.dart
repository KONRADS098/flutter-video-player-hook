import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

import '../hooks/video_player_hook.dart';

void main() => runApp(
      MaterialApp(
        home: BackgroundVideo(),
      ),
    );

class BackgroundVideo extends HookWidget {
  BackgroundVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = useVideoPlayerController(
      dataSource: "assets/sample-mp4-file.mp4",
      looping: true,
    );

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}
