import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

import 'hooks/video_player_hook.dart';

void main() => runApp(
      MaterialApp(
        home: BackgroundVideo(
          child: Text("..."),
        ),
      ),
    );

class BackgroundVideo extends HookWidget {
  final Widget? child;

  BackgroundVideo({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = useVideoPlayerController(
      dataSource: "assets/sample-mp4-file.mp4",
      looping: true,
    );

    return Container(
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(_controller),
            child ?? Container(),
          ],
        ),
      ),
    );
  }

  // @override
  // _BackgroundVideoState createState() => _BackgroundVideoState();
}

// class _BackgroundVideoState extends State<BackgroundVideo> {
// late VideoPlayerController _controller;
//
// @override
// void initState() {
//   super.initState();
//   _controller = VideoPlayerController.asset('assets/sample-mp4-file.mp4');
//
//   _controller.addListener(() {
//     setState(
//       () {},
//     );
//   });
//
//   _controller.setLooping(true);
//
//   _controller.initialize().then(
//         (_) => setState(
//           () {},
//         ),
//       );
//
//   _controller.play();
// }
//
// @override
// void dispose() {
//   _controller.dispose();
//   super.dispose();
// }

// @override
// Widget build(BuildContext context) {
//   return Container(
//     child: AspectRatio(
//       aspectRatio: _controller.value.aspectRatio,
//       child: Stack(
//         children: [
//           VideoPlayer(_controller),
//           widget.child ?? Container(),
//         ],
//       ),
//     ),
//   );
// }
// }
