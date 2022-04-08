import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController useVideoPlayerController({
  required String dataSource,
  bool looping = false,
}) {
  return use(_VideoPlayerControllerHook(dataSource, looping));
}

class _VideoPlayerControllerHook extends Hook<VideoPlayerController> {
  final String dataSource;
  final bool looping;

  const _VideoPlayerControllerHook(this.dataSource, this.looping);

  @override
  HookState<VideoPlayerController, _VideoPlayerControllerHook> createState() {
    return _VideoPlayerHookState();
  }
}

class _VideoPlayerHookState
    extends HookState<VideoPlayerController, _VideoPlayerControllerHook> {
  late VideoPlayerController controller;

  @override
  void didUpdateHook(_VideoPlayerControllerHook oldHook) {
    super.didUpdateHook(oldHook);
    if (oldHook.looping != hook.looping) {
      controller.setLooping(hook.looping);
    }
  }

  @override
  void initHook() {
    super.initHook();
    controller = VideoPlayerController.asset(hook.dataSource)
      ..initialize().then((_) {
        controller.setVolume(0.0);
        controller.setLooping(hook.looping);
        controller.play();
        // ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  VideoPlayerController build(BuildContext context) {
    return controller;
  }

  @override
  void dispose() {
    controller.dispose();
  }
}
