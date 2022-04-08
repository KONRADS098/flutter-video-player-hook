import 'package:flutter/material.dart';

class BackgroundVideoWrapper extends StatelessWidget {
  final Widget videoPlayer;
  final Widget child;

  const BackgroundVideoWrapper({
    Key? key,
    required this.videoPlayer,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        videoPlayer,
        child,
      ],
    );
  }
}
