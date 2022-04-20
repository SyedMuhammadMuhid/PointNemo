

import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_nemo/globals/constants.dart';
import 'package:point_nemo/globals/textStyles.dart';
import 'package:point_nemo/globals/variabes.dart';
import 'package:point_nemo/ui/screens/home.dart';
import 'package:point_nemo/ui/screens/task_badges_two.dart';
import 'package:point_nemo/ui/screens/task_profile_two.dart';
import 'package:point_nemo/ui/widgets/points_animated.dart';
import 'package:point_nemo/ui/widgets/scored_progress_bar.dart';
import 'package:shimmer/shimmer.dart';

class TaskBadges extends StatefulWidget {
  const TaskBadges({Key? key}) : super(key: key);

  @override
  _TaskBadgesState createState() => _TaskBadgesState();
}

class _TaskBadgesState extends State<TaskBadges> with TickerProviderStateMixin{

  final playerBadges = AudioCache();
  @override
  void initState() {
    super.initState();
    playerBadges.play("music/badgesScreen.wav");
    // TODO: implement initState

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
                child: SvgPicture.asset("assets/images/icons/backwardTriArrows.svg"),
              ),
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Text(
                  "Back",
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
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(height: 25,),
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
                            child: Container(
                              //alignment: Alignment.centerLeft,
                              child: Image.asset("assets/pictures/user_one_badge_profile.png"),),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Flexible(child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Color(0xffff6600),
                                      period: Duration(seconds: 15),
                                      child: AnimatedFlipCounter(
                                        duration: Duration(milliseconds: 500),
                                        value: userOnePoints,
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
                                Flexible(child: Align( alignment: Alignment.centerRight, child: Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor: Color(0xffff6600),
                                  period: Duration(seconds: 15),
                                  child: AnimatedFlipCounter(
                                    duration: Duration(milliseconds: 500),
                                    value: userOneRank,
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
                  SizedBox(height: 10,),
                  // second section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Color(0xff632806),
                          period: Duration(seconds: 4),
                          child: Text(
                              "BADGES",
                            style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Games',
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                            onTap: awardTapped,
                            child: Image.asset("assets/pictures/praise_your_crewmates.png", width: 280,)),
                      ),
                    ],
                  ),
                  // third section table
                  Expanded(
                    flex: 6,
                    child: Container(
                      child: Image.asset("assets/pictures/user_one_badges.png", fit: BoxFit.cover,),),
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> awardTapped(){
    final sendPlayer = AudioCache();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              scrollable: true,
              content: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      // // Navigate to Next User Screen
                      philipBadgeWon = true;
                      sendPlayer.play("music/sendBadge.wav");
                      showToastWidget(
                          Image.asset(
                            "assets/pictures/badge_sent_toast.png",
                            width: MediaQuery.of(context)
                                .size
                                .width /
                                2,
                            height: 200,
                          ),
                          position: StyledToastPosition.center,
                          // alignment: Alignment.centerRight,
                          animDuration: Duration(seconds: 1),
                          duration: Duration(seconds: 3),
                          curve: Curves.easeInOut,
                          context: context,
                        onDismiss: (){
                          // Future.delayed(Duration(milliseconds: 750), () {
                          //   Navigator.pushAndRemoveUntil(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => HomeScreen()),
                          //           (Route<dynamic> route) => false);
                          // });
                        }
                        );
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => TaskBadgesTwo()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF370647),
                          borderRadius: BorderRadius.circular(40),
                            // gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.topRight,
                            //     colors: [Color(0xff160647), Color(0xff370647)])
               ),
                        child: Image.asset("assets/pictures/award_recog_popup.png", scale: 1.75))), // Container(color: Colors.yellow,) // UserPinPopup(),
              ));
        });
  }
}
