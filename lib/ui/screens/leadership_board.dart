import 'package:animated_background/animated_background.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  final List<Image> leaderBoardResultsList = [Image.asset(
  "assets/pictures/leaderboard_user_results.png",
  // fit: BoxFit.cover,
  ), Image.asset(
    "assets/pictures/leaderboard_shift_results.png",
    // fit: BoxFit.cover,
  ), ];

  CarouselController buttonCarouselController = CarouselController();
  final leaderPlayer = AudioCache();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leaderPlayer.play("music/loadLeader.wav", volume: soundVolume);
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation = controller
      ..addListener(() {
        setState(() {}
        );
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // controller.dispose();
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
              onTap: (){
                controller.dispose();
                Navigator.pop(context);},
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
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
                                  height: 110,
                                  width: 220,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [Color(0xff071B2B), Color(0xff010101)])
                                  ),
                                  child: AnimatedBuilder(
                                    animation: animation,
                                    builder: (context, child) {
                                      return CustomPaint(
                                        foregroundPainter: BorderPainter(controller.value),
                                        child: Container(
                                            alignment: Alignment.topCenter,
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Morning Shift",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: "Meteoric",
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Shimmer.fromColors(
                                                    baseColor: Colors.white,
                                                    highlightColor: Color(0xFFFED843),
                                                    period: Duration(seconds: 2),
                                                    child: Text(
                                                      "1420",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 32,
                                                        fontFamily: "Meteoric",
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "Total Team Points",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily: "Meteoric",
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
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
                    child: Row(
                      children: [
                        Container(
                          width: 65,
                          height: double.infinity,
                          child: Center(
                            child: InkWell(
                              onTap: () => buttonCarouselController.previousPage(
                                  duration: Duration(milliseconds: 600), curve: Curves.linear),
                              child: Container(
                                // decoration: const BoxDecoration(
                                //     gradient: LinearGradient(
                                //         begin: Alignment.bottomLeft,
                                //         end: Alignment.topRight,
                                //         colors: [Color(0xff160647), Color(0xff370647)])),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color(0xff730AAF),
                                  child: FaIcon(FontAwesomeIcons.anglesLeft, color: Colors.white, size: 25,),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child:CarouselSlider.builder(
                                options: CarouselOptions(
                                  // height: 400,
                                  // aspectRatio: 16/9,
                                  viewportFraction: 1.0,
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  autoPlay: false,
                                  // autoPlayInterval: Duration(seconds: 3),
                                  // autoPlayAnimationDuration: Duration(milliseconds: 800),
                                  // autoPlayCurve: Curves.fastOutSlowIn,
                                  // enlargeCenterPage: true,
                                  // onPageChanged: callbackFunction,
                                  scrollDirection: Axis.horizontal,
                                ),
                                carouselController: buttonCarouselController,
                                itemCount: leaderBoardResultsList.length,
                                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                                    Container(child: leaderBoardResultsList[itemIndex])
                              // Image.asset("assets/pictures/TaskComments.png")

                            ),
                          ),
                        ),
                        Container(
                          width: 65,
                          height: double.infinity,
                          child: Center(
                            child: InkWell(
                              onTap: () => buttonCarouselController.nextPage(
                                  duration: Duration(milliseconds: 600), curve: Curves.linear),
                              child: Container(
                                // decoration: const BoxDecoration(
                                //     gradient: LinearGradient(
                                //         begin: Alignment.bottomLeft,
                                //         end: Alignment.topRight,
                                //         colors: [Color(0xff160647), Color(0xff370647)])),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color(0xff730AAF),
                                  child: FaIcon(FontAwesomeIcons.anglesRight, color: Colors.white, size: 25,),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 10,),
                  // Input keyboard
                  // Expanded(
                  //     flex: 1,
                  //     child: Image.asset("assets/pictures/leaderboard_footer.png")),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
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
