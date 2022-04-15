import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:point_nemo/globals/constants.dart';
import 'package:point_nemo/globals/textStyles.dart';
import 'package:point_nemo/ui/screens/task_badges.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:point_nemo/ui/widgets/points_animated.dart';
import 'package:point_nemo/ui/widgets/scored_progress_bar.dart';
import "";

class TaskProfile extends StatefulWidget {
  const TaskProfile({Key? key}) : super(key: key);

  @override
  _TaskProfileState createState() => _TaskProfileState();
}

class _TaskProfileState extends State<TaskProfile>
    with TickerProviderStateMixin {
  // >> Globals
  // styles
  // static const TextStyle backNavigationTextStyle = TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Adelle");
  final List<Image> commentsList = [
    Image.asset("assets/pictures/TaskComments.png"),
    Image.asset("assets/pictures/TaskComments2.png")
  ];

  CarouselController buttonCarouselController = CarouselController();

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
                            FontAwesomeIcons.anglesLeft,
                            color: Colors.white,
                            size: 25,
                          ),
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
                                    child: Image.asset(
                                        "assets/pictures/userDetails.png"),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Flexible(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "Total Points 80",
                                              style: pointsHeaderTextStyle,
                                            ))),
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
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "Rank 09",
                                              style: pointsHeaderTextStyle,
                                            ))),
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
                                carouselController: buttonCarouselController,
                                itemCount: commentsList.length,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    Container(child: commentsList[itemIndex])
                                // Image.asset("assets/pictures/TaskComments.png")

                                ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                    onTap: () => Navigator.pop(context),
                    child: Center(
                        child: Image.asset(
                            "assets/pictures/note_to_manager.png"))), // Container(color: Colors.yellow,) // UserPinPopup(),
              ));
        });
  }

  void userCardTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TaskBadges()));
  }
}
