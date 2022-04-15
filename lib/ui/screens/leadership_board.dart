import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_nemo/globals/constants.dart';
import 'package:point_nemo/globals/textStyles.dart';
import 'package:shimmer/shimmer.dart';

class LeadershipBoard extends StatefulWidget {
  const LeadershipBoard({Key? key}) : super(key: key);

  @override
  _LeadershipBoardState createState() => _LeadershipBoardState();
}

class _LeadershipBoardState extends State<LeadershipBoard>
    with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation = controller
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xff160647), Color(0xff370647)])),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SvgPicture.asset(
                    "assets/images/icons/backwardTriArrows.svg"),
              ),
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Text(
                  "Home",
                  style: backNavigationTextStyle,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: particleOptions,
              paint: particlePaint,
            ),
            vsync: this,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // First section
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 250,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                            child: Container(
                                //alignment: Alignment.centerRight,
                                // child: Text(
                                //   "Total Points 50",
                                //   style: pointsHeaderTextStyle,
                                // )
                            )),
                        // Linear Progress Animator
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Image.asset("assets/pictures/leaderboard_cup.png"),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                            child: Center(
                              child: Container(
                                height: 80,
                                width: 220,
                                child: AnimatedBuilder(
                                  animation: animation,
                                  builder: (context, child) {
                                    return CustomPaint(
                                      foregroundPainter: BorderPainter(controller.value),
                                      child: Container(
                                          alignment: Alignment.topCenter,
                                          child: Center(
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.white,
                                              highlightColor: Color(0xFFFED843),
                                              period: Duration(seconds: 2),
                                              child: Text(
                                                "Target 1400pts",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontFamily: "Meteoric",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          )
                                      ),
                                    );
                                  }
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),

                // second section table
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 150),
                    child: Image.asset(
                      "assets/pictures/leaderboard_results.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                // Input keyboard
                Expanded(
                    flex: 1,
                    child: Image.asset("assets/pictures/leaderboard_footer.png")),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  final double controller;

  BorderPainter(this.controller);

  @override
  void paint(Canvas canvas, Size size) {
    // print("width: ${controller}");
    // print("height: ${controller}");
    // print("controller: ${controller}");
    double _sh = size.height; // For path shortage
    double _sw = size.width; // For path shortage
    double _line = 50.0; // Length of the animated line
    // double _c1 = controller; // Controller value for top and left border.
    // double _c2 = controller >= 0.5 ? (controller - 0.5) : 0; // Controller value for bottom and right border.
    double _c1 = controller * 2; // Controller value for top and left border.
    double _c2 = controller >= 0.5 ? (controller - 0.5) * 2 : 0;

    Paint paint1 = Paint()
      ..color = Color(0xFF8FFCFC).withOpacity(0.8)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    Paint paint2 = Paint()
      ..color = Color(0xFFEE71DA).withOpacity(0.8)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    //
    // Path _top = Path()
    //   ..moveTo(_sw * _c1 > _sw ? _sw : _sw * _c1, 0)
    //   ..lineTo(_sw * _c1 + _line >= _sw ? _sw : _sw * _c1 + _line, 0);
    //
    // Path _left = Path()
    //   ..moveTo(0, _sh * _c1 > _sh ? _sh * -1 : _sh * _c1 * -1)
    //   ..lineTo(0, _sh * _c1 + _line >= _sh ? _sh * -1 : _sh * _c1 * -1 + _line);
    //
    // Path _right = Path()
    //   ..moveTo(_sw, _sh * _c1)
    //   ..lineTo(
    //       _sw,
    //       _sh * _c1 + _line >= _sh ? _sh : _sh * _c1 + _line);
    //
    // Path _bottom =  Path()
    //   ..moveTo(_sw / _c1 < _sw ? _sw / _c1 : _sw, 0)
    //   ..lineTo(
    //       _sw / _c1 + _line <= _sw ? _sw / _c1 + _line : _sw, 0
    //   );

    Path _top = Path()
      ..moveTo(_sw * _c1 > _sw ? _sw : _sw * _c1, 0)
      ..lineTo(_sw * _c1 + _line >= _sw ? _sw : _sw * _c1 + _line, 0);

    Path _left = Path()
      ..moveTo(0, _sh * _c1 > _sh ? _sh : _sh * _c1)
      ..lineTo(0, _sh * _c1 + _line >= _sh ? _sh : _sh * _c1 + _line);

    Path _right = Path()
      ..moveTo(_sw, _sh * _c2)
      ..lineTo(
          _sw,
          _sh * _c2 + _line > _sh
              ? _sh
              : _sw * _c1 + _line >= _sw
              ? _sw * _c1 + _line - _sw
              : _sh * _c2);

    Path _bottom = Path()
      ..moveTo(_sw * _c2, _sh)
      ..lineTo(
          _sw * _c2 + _line > _sw
              ? _sw
              : _sh * _c1 + _line >= _sh
              ? _sh * _c1 + _line - _sh
              : _sw * _c2,
          _sh);

    canvas.drawPath(_top, paint1);
    canvas.drawPath(_bottom, paint2);
    canvas.drawPath(_right, paint1);
    canvas.drawPath(_left, paint2);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
}
