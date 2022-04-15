

import 'dart:math';
import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:point_nemo/globals/constants.dart';
import 'package:point_nemo/globals/textStyles.dart';
import 'package:point_nemo/ui/screens/home.dart';
import 'package:point_nemo/ui/screens/task_badges_two.dart';
import 'package:point_nemo/ui/widgets/scored_progress_bar.dart';

class TaskProfileTwo extends StatefulWidget {
  const TaskProfileTwo({Key? key}) : super(key: key);

  @override
  _TaskProfileTwoState createState() => _TaskProfileTwoState();
}

class _TaskProfileTwoState extends State<TaskProfileTwo> with TickerProviderStateMixin{

  // >> Globals
  // styles
  // static const TextStyle backNavigationTextStyle = TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Adelle");
  final List<Image> commentsList = [Image.asset("assets/pictures/TaskComments.png"), Image.asset("assets/pictures/TaskComments2.png") ];

  CarouselController buttonCarouselController = CarouselController();

  late ConfettiController _controllerTopCenter;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerTopCenter.play();
    Future.delayed(Duration(seconds: 4), (){
      _controllerTopCenter.stop();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerTopCenter.dispose();
    super.dispose();
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
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomeScreen()), (Route<dynamic> route) => false);
              } ,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SvgPicture.asset("assets/images/icons/backwardTriArrows.svg"),
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
            child: Stack(
              children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 100,
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
                                Expanded(
                                  child: InkWell(
                                    onTap: userCardTap,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Image.asset("assets/pictures/user_Details_2.png"),),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Flexible(child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text("Total Points 80", style: pointsHeaderTextStyle,))),
                                      // Linear Progress Animator
                                      Container(
                                        height: 20,
                                        width: 200,
                                        child: LiquidProgressIndicator(),
                                        // LinearProgressIndicator(
                                        //   value: 70,
                                        //   backgroundColor: Colors.black38,
                                        //   color: Color(0xff632806),
                                        // ),
                                      ),
                                      Flexible(child: Align( alignment: Alignment.centerRight, child: Text("Rank 12", style: pointsHeaderTextStyle,))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // second section table
                        Expanded(
                          flex: 6,
                          child: InkWell(
                            onTap: noteTapped,
                            child: Container(
                              child:
                              CarouselSlider.builder(
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
                                  itemCount: commentsList.length,
                                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                                      Container(child: commentsList[itemIndex])
                                // Image.asset("assets/pictures/TaskComments.png")

                              ),),
                          ),
                        ),
                        SizedBox(height: 10,),
                        // Input keyboard
                        Expanded(
                            flex: 1,
                            child: SvgPicture.asset("assets/pictures/input.svg")),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
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
                Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: _controllerTopCenter,
                    blastDirectionality: BlastDirectionality
                        .explosive, // don't specify a direction, blast randomly
                    shouldLoop:
                    true, // start again as soon as the animation is finished
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ], // manually specify the colors to be used
                    createParticlePath: drawStar, // define a custom shape/path.
                  ),
                ),
            ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> noteTapped(){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              scrollable: true,
              content: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Center(child: Image.asset("assets/pictures/note_to_manager.png"))), // Container(color: Colors.yellow,) // UserPinPopup(),
              ));
        });
  }

  void userCardTap(){
    Navigator.push(context, MaterialPageRoute( builder: (context) => TaskBadgesTwo()));
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}

