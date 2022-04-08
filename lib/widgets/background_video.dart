import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

import '../hooks/video_player_hook.dart';

class BackgroundVideo extends HookWidget {
  const BackgroundVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = useVideoPlayerController(
      dataSource: "assets/bridge.mp4",
      looping: true,
    );

    return Center(
      child: _controller.value.isInitialized
          ?
          // controller has been initialized
          LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width:
                          constraints.maxWidth * _controller.value.aspectRatio,
                      height: constraints.maxHeight,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                );
              },
            )
          : Container(), // controller has not yet initialized
    );
  }
}
