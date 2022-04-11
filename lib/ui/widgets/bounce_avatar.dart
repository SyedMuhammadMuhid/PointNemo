import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Avatar();
}

class _Avatar extends State<Avatar> with TickerProviderStateMixin {
  dynamic _controller;
  Tween<double> _tween = Tween(begin: 0.75, end: 2);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
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
    return Stack(
      children: <Widget>[
        Align(
          child: ScaleTransition(
            scale: _tween.animate(
                CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
