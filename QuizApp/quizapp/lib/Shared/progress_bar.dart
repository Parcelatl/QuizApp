import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class AnimatedProgressbar extends StatefulWidget {
  const AnimatedProgressbar({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedProgressbar> createState() => _AnimatedProgressbarState();
}

class _AnimatedProgressbarState extends State<AnimatedProgressbar> {
  double progressValue = 0;

  @override
  Widget build(BuildContext context) {
    return FAProgressBar(
      size: 12,
      direction: Axis.horizontal,
      currentValue: progressValue,
      maxValue: 100,
      backgroundColor: Colors.grey.shade800,
      progressColor: Colors.green.shade500,
    );
  }

  void updateProgress() {
    setState((){progressValue += 10;});
  }
}
