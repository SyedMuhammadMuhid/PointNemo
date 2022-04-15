
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';


class ScoredProgressBar extends StatelessWidget {
  const ScoredProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FAProgressBar(
      currentValue: 80,
      maxValue: 100,
      size: 200,
      animatedDuration: Duration(seconds: 1),
      direction: Axis.horizontal,
      borderRadius: BorderRadius.all(Radius.circular(12)),
      border: Border.all(color: Colors.black, width: 1.5),
      backgroundColor: Colors.black87,
      progressColor: Color(0xFFC227B0),
      changeColorValue: 50,
      changeProgressColor: Color(0xFFC8233C),
      displayText: null,
      displayTextStyle: const TextStyle( color: Colors.transparent),
    );
  }
}

class LiquidProgressIndicator extends StatelessWidget {
  const LiquidProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LiquidLinearProgressIndicator(
      value: 0.75, // Defaults to 0.5.
      valueColor: AlwaysStoppedAnimation(Color(0xFFC8233C)), // Defaults to the current Theme's accentColor.
      backgroundColor: Colors.black87, // Defaults to the current Theme's backgroundColor.
      borderColor: Colors.black,
      borderWidth: 2.5,
      borderRadius: 12,
      direction: Axis.horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
      center: null,
    );
  }
}
