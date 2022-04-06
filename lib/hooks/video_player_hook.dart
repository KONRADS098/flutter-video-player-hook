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
  late VideoPlayerController _controller;

  @override
  void didUpdateHook(_VideoPlayerControllerHook oldHook) {
    super.didUpdateHook(oldHook);
    if (oldHook.looping != hook.looping) {
      _controller.setLooping(hook.looping);
    }
  }

  @override
  void initHook() {
    super.initHook();
    _controller = VideoPlayerController.asset(hook.dataSource);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.setLooping(hook.looping);

    _controller.initialize().then((_) => setState(() {}));

    _controller.play();
  }

  @override
  VideoPlayerController build(BuildContext context) {
    return _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
  }
}
