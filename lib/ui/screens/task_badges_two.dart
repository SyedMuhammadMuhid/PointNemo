

import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_nemo/globals/constants.dart';
import 'package:point_nemo/globals/textStyles.dart';
import 'package:point_nemo/ui/widgets/scored_progress_bar.dart';
import 'package:shimmer/shimmer.dart';

class TaskBadgesTwo extends StatefulWidget {
  const TaskBadgesTwo({Key? key}) : super(key: key);

  @override
  _TaskBadgesTwoState createState() => _TaskBadgesTwoState();
}

class _TaskBadgesTwoState extends State<TaskBadgesTwo> with TickerProviderStateMixin{
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
                              alignment: Alignment.centerLeft,
                              child: Image.asset("assets/pictures/user_Details_without_Arrow_2.png"),),
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
                                  // child: LinearProgressIndicator(
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
                  // second section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 55),
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
                            child: Image.asset("assets/pictures/praise_crews.png")),
                      ),
                    ],
                  ),
                  // third section table
                  Expanded(
                    flex: 6,
                    child: Container(
                      child: Image.asset("assets/pictures/badges.png", fit: BoxFit.cover,),),
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
                      // Navigate to Next User Screen
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
                    },
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF370647),
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
