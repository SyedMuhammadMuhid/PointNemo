import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Avatar extends StatefulWidget {
  final int index;
  const Avatar({required this.index, Key? key});
  @override
  State<StatefulWidget> createState() => _Avatar();
}

class _Avatar extends State<Avatar> with TickerProviderStateMixin {
  // >> Global Constants
  static const double kAvatarRadius = 35.0;
  static const double kAddFactor = 2.0;
  static const double kSmallAvatarRadius = 16.0;
  static const Color kCrownRingColor = Color(0xFFC2AB11);
  static const Color kHomeBackgroundColor = Color(0xff160647);

  // >> Dummy Variables
  List<String> imagesName = ["green_wing", "super_man", "turtle_king"];

  dynamic _controller;
  Tween<double> _tween = Tween(begin: 0.85, end: 1);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 6000), vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _tween.animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
      child: Stack(
        children: [
          widget.index == 0
              ? Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 22,
                    width: 25,
                    alignment: Alignment.topLeft,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/badges/crown.png')),
                    ),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: widget.index == 0
                ? EdgeInsets.only(top: 10.0, bottom: 10, right: 15)
                : EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
            child: SizedBox(
              child: CircleAvatar(
                radius: kAvatarRadius + kAddFactor,
                backgroundColor: kCrownRingColor,
                child: CircleAvatar(
                  radius: kAvatarRadius,
                  backgroundColor: kHomeBackgroundColor,
                  backgroundImage: AssetImage(
                      'assets/images/userImages/potrait${widget.index >= 10 ? widget.index % 9 : widget.index}.png'),
                ),
              ),
            ),
          ),
          widget.index % 4 == 0
              ? Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 35,
                      width: 35,
                      margin: const EdgeInsets.only(right: 1, bottom: 1),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/badges/${imagesName[widget.index % 3]}.png'),
                            scale: 1.0),
                      ),
                      // child: CircleAvatar(
                      //   radius: kSmallAvatarRadius,
                      //   backgroundColor: kHomeBackgroundColor,
                      //   backgroundImage: AssetImage('assets/images/badges/${imagesName[widget.index % 3]}.png'),
                      // ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
