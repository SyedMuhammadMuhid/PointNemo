import 'dart:math';
import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:point_nemo/globals/constants.dart';
import 'package:point_nemo/globals/textStyles.dart';
import 'package:point_nemo/globals/variabes.dart';
import 'package:point_nemo/ui/screens/home.dart';
import 'package:point_nemo/ui/screens/task_badges_two.dart';
import 'package:point_nemo/ui/widgets/points_animated.dart';
import 'package:point_nemo/ui/widgets/scored_progress_bar.dart';
import 'package:shimmer/shimmer.dart';

class TaskProfileTwo extends StatefulWidget {
  const TaskProfileTwo({Key? key}) : super(key: key);

  @override
  _TaskProfileTwoState createState() => _TaskProfileTwoState();
}

class _TaskProfileTwoState extends State<TaskProfileTwo>
    with TickerProviderStateMixin {
  // >> Globals
  // styles
  // static const TextStyle backNavigationTextStyle = TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Adelle");
  final List<Image> commentsList = [
    Image.asset("assets/pictures/user_two_task_comment1.png"),
    Image.asset("assets/pictures/user_one_task_comment1.png")
  ];

  CarouselController buttonCarouselController = CarouselController();



  final leaderPlayer = AudioCache();
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    advancePlayer.pause();
    leaderPlayer.play("music/loadLeader.wav");

  }

  @override
  void dispose() {
    // TODO: implement dispose

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

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (Route<dynamic> route) => false);
              },
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
          body: WillPopScope(
            onWillPop: () {
              if (isPlaying) {
                advancePlayer.resume();
              }
              Navigator.pop(context);
              return Future.value(true);
            },
            child: AnimatedBackground(
              behaviour: RandomParticleBehaviour(
                options: particleOptions,
                paint: particlePaint,
              ),
              vsync: this,

              child: Row(
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
                            SizedBox(height: 25,),
                            // First section
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 250,
                                width: double.maxFinite,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: userCardTap,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Image.asset(
                                              "assets/pictures/user_two_task_profile.png"),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Flexible(
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Shimmer.fromColors(
                                                    baseColor: Colors.white,
                                                    highlightColor: Color(0xffff6600),
                                                    period: Duration(seconds: 15),
                                                    child: AnimatedFlipCounter(
                                                      duration: Duration(milliseconds: 500),
                                                      value: userTwoPoints,
                                                      textStyle: pointsHeaderTextStyle,
                                                      prefix: "Total Points ",
                                                      // pass in a value like 2014
                                                    ),
                                                  ),)),
                                          // Linear Progress Animator
                                          Container(
                                            width: 320,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: Colors.black,
                                                border: Border.all(
                                                  width:
                                                      5, //                   <--- border width here
                                                )),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(25),
                                                    color: Colors.purple,
                                                  ),
                                                  child: const MyAnimatedLoading(
                                                    offsetSpeed: Offset(1, 0),
                                                    width: 220,
                                                    height: 20,
                                                    colors: [
                                                      Color(0xffff2500),
                                                      Color(0xffff2500),
                                                      Color(0xffff6600),
                                                      Color(0xffff6600),
                                                      Colors.orange,
                                                      Colors.orange,
                                                      Color(0xffF361AC),
                                                      Color(0xffF361AC),
                                                      Colors.purple,
                                                      Colors.purple,
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Shimmer.fromColors(
                                                    baseColor: Colors.white,
                                                    highlightColor: Color(0xffff6600),
                                                    period: Duration(seconds: 15),
                                                    child: AnimatedFlipCounter(
                                                      duration: Duration(milliseconds: 500),
                                                      value: userTwoRank,
                                                      textStyle: pointsHeaderTextStyle,
                                                      prefix: "Rank ",
                                                      // pass in a value like 2014
                                                    ),
                                                  ),)),
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
                                  child: CarouselSlider.builder(
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
                                      carouselController:
                                          buttonCarouselController,
                                      itemCount: commentsList.length,
                                      itemBuilder: (BuildContext context,
                                              int itemIndex, int pageViewIndex) =>
                                          Container(
                                              child: commentsList[itemIndex])
                                      // Image.asset("assets/pictures/TaskComments.png")

                                      ),
                                ),
                              ),
                            ),

                          // Input keyboard
                    Expanded(
                              flex: 1,
                              child: SvgPicture.asset("assets/pictures/input_Keyboard.svg")),
                            SizedBox(height: 10,),
                        ],
                      ),),
                      Container(
                        width: 100,
                        height: double.infinity,
                        child: Center(
                          child: InkWell(
                            onTap: () => buttonCarouselController.nextPage(
                                duration: Duration(milliseconds: 600),
                                curve: Curves.linear),
                            child: Container(
                              // decoration: const BoxDecoration(
                              //     gradient: LinearGradient(
                              //         begin: Alignment.bottomLeft,
                              //         end: Alignment.topRight,
                              //         colors: [Color(0xff160647), Color(0xff370647)])),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Color(0xff730AAF),
                                child: FaIcon(
                                  FontAwesomeIcons.anglesRight,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> noteTapped() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              scrollable: true,
              content: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: InkWell(
                    onTap: () {
                      final sendPlayer = AudioCache();
                      sendPlayer.play("music/sendingMessage.wav");
                      Navigator.pop(context);
                    },
                    child: Center(
                        child: Image.asset(
                            "assets/pictures/note_to_manager.png", scale: 1.5))), // Container(color: Colors.yellow,) // UserPinPopup(),
              ));
        });
  }

  void userCardTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TaskBadgesTwo()));
  }


}
