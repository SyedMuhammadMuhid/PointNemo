import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:point_nemo/globals/constants.dart';
import 'package:point_nemo/globals/textStyles.dart';
import 'package:point_nemo/ui/screens/leadership_board.dart';
import 'package:point_nemo/ui/screens/task_profile.dart';
import 'package:point_nemo/ui/widgets/bounce_avatar.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List SideBar = ["", "", "", "", ""];
  List Bar = ["", "", "", "", "", "", ""];
  List<UserAvatars> usersList = [];
  Tween<double> _tween = Tween(begin: 0.75, end: 1);
  bool enterPin = false;
  List<Map<String, int>> missionTextList = [{ "Clean coffee machine" : 10},{ "Fountain ice stock": 10},{ "Restock coffee supplies" : 50 } ,
{ "Wipe down counters" : 15}, { "Turn off electronics and other appliances" : 20}, {"Wipe down ice machines out front": 5}, { "Check that all display are in order": 30},
    {  "Dust off tables": 10 }, { "Physically count all your products if necessary": 5 },
  ];
  List<Map<String, int>> accomplishmentTextList = [{ "Turn off electronics and other appliances" : 20},{ "Restock shelves if necessary": 5}, { "Ensure that product tags are in order" : 20}, { "Enter your daily cash float": 15},];
  List<int> leaderBoardPoints = [232, 198, 170, 166, 160, 150, 140, 130, 180];

  final defaultPinTheme = PinTheme(
    width: 90,
    height: 80,
    textStyle: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xFF731B81)),
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF704B83),
    ),
  );
  // Particles
  // ParticleType? _particleType = ParticleType.Image;
  // Image _image = Image.asset('assets/images/star_stroke.png');


  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    lowerBound: 0.6,
    upperBound: 1.0,
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutBack,
  );

  late AnimationController controller;
  late Animation<double> animation;
  final _userAvatarListKey = GlobalKey<AnimatedListState>();
  @override
  void initState() {
    // TODO: implement initState
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
    for (int i = 0; i < 10; i++) {
      Future.delayed(const Duration(seconds: 1), () {
        usersList.insert(
            i,
            UserAvatars(
              index: i,
            ));
        _userAvatarListKey.currentState?.insertItem(i);
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print("Build");
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
    int SideBarIndex = 0;
    int BarIndex = 0;

    return SafeArea(
      child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xff160647), Color(0xff370647)])),
          child: true
              ? Scaffold(
                  backgroundColor: Colors.transparent,
                  body: AnimatedBackground(
                    behaviour: RandomParticleBehaviour(
                      options: particleOptions,
                      paint: particlePaint,
                    ),
                    vsync: this,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Header
                          Container(
                            height: 300,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                    right: 30,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       right: 15.0),
                                      //   child: const Icon(
                                      //     Icons.notifications_none_rounded,
                                      //     size: 35,
                                      //     color: Colors.white,
                                      //   ),
                                      // ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(Icons.volume_mute_sharp, color: Colors.white, size: 35,),
                                          Icon(Icons.close, color: Colors.white, size: 25,),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 35,
                                      ),
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Color(0xFFFF006F),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal : 8.0),
                                        child: Text(
                                          'MENU',
                                          style: TextStyle(
                                              fontSize: 26,
                                              color: Colors.white,
                                              // fontWeight: FontWeight.bold,
                                              fontFamily: 'Neuropol',
                                              letterSpacing: 0),
                                        ),
                                      ),
                                      SvgPicture.asset("assets/images/icons/menuIcon.svg",
                                        color: Colors.white,
                                        height: 20,
                                        width: 20,
                                      ),
                                      // Icon(
                                      //   Icons.menu_rounded,
                                      //   size: 35,
                                      //   color: Colors.white,
                                      // )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "LEADERBOARD",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                        fontFamily: 'Games',
                                        letterSpacing: 1),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        width:
                                            MediaQuery.of(context).size.width - 30,
                                        child: AnimatedList(
                                          key: _userAvatarListKey,
                                          scrollDirection: Axis.horizontal,
                                          initialItemCount: usersList
                                              .length + 1, //checkList.length,
                                          itemBuilder:
                                              (context, index, animation) {
                                            return  index == usersList.length ? Container(width: 50,) :
                                            SlideTransition(
                                                position: animation.drive(
                                                  Tween<Offset>(
                                                    begin: Offset.zero,
                                                    end: const Offset( 0.5, 0.0),
                                                  ),
                                                ),
                                                child: usersList[index]);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, top: 0, right: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(

                                        child: Shimmer.fromColors(
                                          baseColor: Colors.white,
                                          highlightColor: Color(0xff632806),
                                          period: Duration(seconds: 4),
                                          child: Text(
                                            "MISSIONS",
                                            style: TextStyle(
                                                fontSize: 34,
                                                fontFamily: 'Games',
                                                color: Colors.white,
                                                //fontWeight: FontWeight.bold,
                                                letterSpacing: 4),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(),
                                      ),
                                      // Timer Here
                                      Flexible(
                                          child: Container(),
                                      ),
                                      Flexible(
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.white,
                                          highlightColor: Color(0xFFFED843),
                                          period: Duration(seconds: 3),
                                          child: Text(
                                            "ACCOMPLISHMENTS",
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'Games',
                                                color: Colors.white,
                                                // fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 25),
                            child: Container(
                              // height: MediaQuery.of(context).size.height - 325,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //
                                  Expanded(
                                    // flex: 2,
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            SideBar.length * 4 > Bar.length
                                                ? SideBar.length * 4
                                                : Bar.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisSpacing: 12,
                                                mainAxisSpacing: 12,
                                                crossAxisCount: 4,
                                                childAspectRatio: 1.8),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          index = index + 1;
                                          if (index % 4 != 0) {
                                            // print("oo");
                                            BarIndex++;
                                          }
                                          return Padding(
                                            padding: index % 4 == 0
                                                ? const EdgeInsets.only(
                                                    left: 40.0)
                                                : const EdgeInsets.only(
                                                    left: 0),
                                            child:
                                                BarIndex < Bar.length ||
                                                        index % 4 == 0
                                                    ? index % 4 == 0
                                                        ? Container(
                                                  decoration:  BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          15),
                                                      gradient: LinearGradient(
                                                          begin: Alignment.bottomLeft,
                                                          end: Alignment.topRight,
                                                          colors: [Color(0xff4E1151), Color(0xff632806)])),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  flex: 5,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xff060a1a),
                                                                      // border: Border.all(
                                                                      //
                                                                      // ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Flexible(
                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                            children: [
                                                                              Container(
                                                                                height: 20,
                                                                                width: 35,
                                                                                child: Icon(Icons.check, color: Color(0xff3AF40A), size: 35,),// SvgPicture.asset("assets/images/icons/checkDouble.svg", color: Color(0xff3AF40A),),// FaIcon(FontAwesomeIcons.clock, color: Color(0xff3AF40A), size: 20,),
                                                                              ),

                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          child: Padding(    
                                                                              padding: const EdgeInsets.only(
                                                                                  left: 15.0,
                                                                                  right: 5,
                                                                                  top: 0),
                                                                              child: Text(
                                                                                "Restock the shelves, if nessesery",
                                                                                maxLines: 2,
                                                                                style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Meteoric"),
                                                                              )),
                                                                        ),
                                                                        Flexible(
                                                                          child: Container(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 15.0,
                                                                                bottom: 05,
                                                                                right: 15),
                                                                            child:
                                                                                Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                // Row(
                                                                                //   children: [
                                                                                //     Image.asset("assets/images/coin.png"),
                                                                                //     Padding(
                                                                                //       padding: const EdgeInsets.only(left: 8.0),
                                                                                //       child: Text(
                                                                                //         "10 pts",
                                                                                //         style: TextStyle(color: Color(0xfffabe2c), fontSize: 18, fontFamily: "Adelle", fontWeight: FontWeight.bold),
                                                                                //       ),
                                                                                //     ),
                                                                                //   ],
                                                                                // ),
                                                                                CircleAvatar(
                                                                                  radius: 18,
                                                                                  backgroundImage: AssetImage("assets/images/userImages/potrait${index >= 10 ? index % 9 : index }.png"),
                                                                                  backgroundColor: Colors.transparent,
                                                                                ),
                                                                                SizedBox(width: 10,),
                                                                                Text(
                                                                                  "Anthony Miller",
                                                                                  style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Adelle",),
                                                                                ),
                                                                                // Container(
                                                                                //   height: 40,
                                                                                //   child: Image.asset("assets/images/doneAch.png"),
                                                                                // )
                                                                                ],
                                                                              ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              8.0),
                                                                      child:
                                                                          Row(
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                              padding: const EdgeInsets.only(right: 10.0, left: 5.0),
                                                                              child: Container(
                                                                                height: 14,
                                                                                child: Image.asset("assets/images/coin.png", color: Color(0xFFFED843),),
                                                                              )),
                                                                          Text(
                                                                            "5 points earned",
                                                                            style:
                                                                                TextStyle(fontSize: 14, fontFamily: "Adelle", color: Color(0xFFFED843), fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ))
                                                              ],
                                                            ),
                                                          )
                                                        : AnimatedBuilder(
                                                            animation:
                                                                animation,
                                                            builder: (context,
                                                                child) {
                                                              return CustomPaint(
                                                                foregroundPainter: index ==
                                                                        1
                                                                    ? BorderPainter(
                                                                        controller
                                                                            .value)
                                                                    : null,
                                                                child:
                                                                    InkWell(
                                                                      onTap: cardTapped,
                                                                      child: Container(
                                                                  decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xff060a1a),
                                                                      // border: Border.all(
                                                                      //
                                                                      // ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                  ),
                                                                  child: Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left:
                                                                                  15.0,
                                                                              right:
                                                                                  25,
                                                                              top:
                                                                                  16),
                                                                          child:
                                                                              Text(
                                                                            "Do a security inspection, perform daily housekeeping",
                                                                            maxLines: 2,
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 17,
                                                                                fontFamily: "Meteoric",
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 15.0,
                                                                                bottom: 15,
                                                                                right: 15),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Image.asset("assets/images/coin.png"),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.only(left: 8.0),
                                                                                      child: Text(
                                                                                        "10 points",
                                                                                        style: TextStyle(color: Color(0xfffabe2c), fontSize: 18, fontFamily: "Adelle", fontWeight: FontWeight.bold),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                index == 1
                                                                                    ? SvgPicture.asset(
                                                                                        "assets/images/urgentAch.svg",
                                                                                      )
                                                                                    : ScaleTransition(
                                                                                        scale: _animation,
                                                                                        child: Container(
                                                                                          height: 30,
                                                                                          width: 25,
                                                                                          decoration: const BoxDecoration(image:  DecorationImage(image: AssetImage("assets/images/flag.png"))),
                                                                                        ),
                                                                                        // const Icon(
                                                                                        //   Icons.flag_outlined,
                                                                                        //   color: Colors.red,
                                                                                        //   size: 30,
                                                                                        // ),
                                                                                      )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                  ),
                                                                ),
                                                                    ),
                                                              );
                                                            },
                                                          )
                                                    : Container(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
              : Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30.0, left: 30, right: 30, bottom: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        // CircleAvatar(
                                        //   radius: 22,
                                        //   backgroundColor: Colors.pinkAccent.shade400,
                                        //   child: Container(
                                        //       height: 30,
                                        //       child:
                                        //           Image.asset("assets/images/trophy.png")),
                                        // ),
                                        Text(
                                          "TOP PERFORMERS",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 2),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
                                          child: Icon(
                                            Icons.notifications_none_rounded,
                                            size: 35,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.menu_rounded,
                                          size: 35,
                                          color: Colors.white,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 10, //checkList.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              index == 0
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            height: 100,
                                                            width: 100,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/crownAvatar.svg",
                                                            ),
                                                          ),
                                                          Positioned(
                                                            child: CircleAvatar(
                                                              radius: 38,
                                                              backgroundImage:
                                                                  AssetImage(
                                                                      "assets/images/potrait${index + 1}.jpg"),
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                            ),
                                                            left: 15,
                                                            top: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  :
                                                  // return
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8,
                                                              top: 25,
                                                              bottom: 8),
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Color(0xffc2ab12),
                                                        radius: 42,
                                                        child: CircleAvatar(
                                                          radius: 41,
                                                          backgroundColor:
                                                              Colors.black,
                                                          child: CircleAvatar(
                                                            radius: 38,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    "assets/images/potrait${index + 1}.jpg"),
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                              Text(
                                                "209 pts",
                                                style: TextStyle(
                                                    color: index == 0
                                                        ? Color(0xffc2ab12)
                                                        : Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, top: 25, right: 30),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "MISSIONS",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 2),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 150.0),
                                        child: Text(
                                          "ACCOMPLISHMENTS",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 2),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 25),
                          child: Container(
                            // height: MediaQuery.of(context).size.height - 325,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  // flex: 2,
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: SideBar.length * 4 > Bar.length
                                          ? SideBar.length * 4
                                          : Bar.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisSpacing: 12,
                                              mainAxisSpacing: 8,
                                              crossAxisCount: 4,
                                              childAspectRatio: 1.8),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        index = index + 1;
                                        if (index % 4 != 0) {
                                          print("oo");
                                          BarIndex++;
                                        }
                                        return Padding(
                                          padding: index % 4 == 0
                                              ? const EdgeInsets.only(
                                                  left: 40.0)
                                              : const EdgeInsets.only(left: 0),
                                          child:
                                              BarIndex < Bar.length ||
                                                      index % 4 == 0
                                                  ? index % 4 == 0
                                                      ? Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            // border: Border.all(
                                                            //
                                                            // ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                flex: 5,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xff060a1a),
                                                                    // border: Border.all(
                                                                    //
                                                                    // ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 15.0,
                                                                              right: 25,
                                                                              top: 25),
                                                                          child: Text(
                                                                            "Restock the shelves, if nessesery",
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontSize: 15),
                                                                          )),
                                                                      Container(
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 15.0,
                                                                              bottom: 15,
                                                                              right: 15),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  Image.asset("assets/images/coin.png"),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(left: 8.0),
                                                                                    child: Text(
                                                                                      "10 pts",
                                                                                      style: TextStyle(color: Color(0xfffabe2c), fontSize: 18, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              CircleAvatar(
                                                                                radius: 18,
                                                                                backgroundImage: AssetImage("assets/images/potrait9.jpg"),
                                                                                backgroundColor: Colors.transparent,
                                                                              ),
                                                                              Container(
                                                                                height: 40,
                                                                                child: Image.asset("assets/images/doneAch.png"),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8.0),
                                                                    child: Row(
                                                                      children: [
                                                                        Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(right: 5.0),
                                                                            child: Container(
                                                                              height: 14,
                                                                              child: Image.asset("assets/images/lilCrown.png"),
                                                                            )),
                                                                        Text(
                                                                          "10 points earned by barndy king",
                                                                          style: TextStyle(
                                                                              fontSize: 13,
                                                                              color: Colors.white),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ))
                                                            ],
                                                          ),
                                                        )
                                                      : Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xff060a1a),
                                                            // border: Border.all(
                                                            //
                                                            // ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            15.0,
                                                                        right:
                                                                            25,
                                                                        top:
                                                                            25),
                                                                child: Text(
                                                                  "Do a security inspection, perform daily housekeeping",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          15.0,
                                                                      bottom:
                                                                          15,
                                                                      right:
                                                                          15),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Image.asset(
                                                                              "assets/images/coin.png"),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 8.0),
                                                                            child:
                                                                                Text(
                                                                              "10 pts",
                                                                              style: TextStyle(color: Color(0xfffabe2c), fontSize: 18, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      index == 1
                                                                          ? SvgPicture
                                                                              .asset(
                                                                              "assets/images/urgentAch.svg",
                                                                            )
                                                                          : Icon(
                                                                              Icons.flag_outlined,
                                                                              color: Colors.red,
                                                                              size: 30,
                                                                            )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                  : Container(
                                                      color: Colors.transparent,
                                                    ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))),
    );
  }


  Future<dynamic> cardTapped(){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              scrollable: true,
              content: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 50,
                         margin: EdgeInsets.symmetric( vertical: 15),
                          child: Text("ENTER YOUR PIN", style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),)),
                      Pinput(
                        onCompleted: (pin) => print(pin),
                        keyboardAppearance: Brightness.dark,
                        defaultPinTheme: defaultPinTheme,
                        validator: (pin){
                          if(pin?.length != 4){
                            return "Please Enter 4-digit Pin.";
                          }
                        },
                      ),
                      SizedBox(height: 50,),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TaskProfile()));
                        },
                        child: Container(
                          height: 50,
                            margin: EdgeInsets.symmetric( vertical: 15),
                            child: Wrap(
                              //alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("NEXT", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: "Impact",
                                  letterSpacing: 2,
                                  // fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(width: 10,),
                                FaIcon(FontAwesomeIcons.anglesRight, color: Colors.white60, size: 25,)
                              ],
                            ),),
                      ),
                      // IconButton(
                      //   icon: Icon(Icons.arrow_forward_ios),
                      //   onPressed: () => Navigator.push(context, MaterialPageRoute( builder: (context) => TaskProfile())),
                      // ),
                    ],
                  ), // Container(color: Colors.yellow,) // UserPinPopup(),
              ));
        });
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

class UserAvatars extends StatelessWidget {
  final int index;
  const UserAvatars({Key? key, this.index = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: index == 9 ? () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) => LeadershipBoard()))
          : null,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8, top: 10, bottom: 8),
              child: Avatar(
                index: index,
              )),
          Text(
            index == 9 ? "View All" : "209 pts",
            style: TextStyle(
                color: index == 0 ? const Color(0xffc2ab12) : Colors.white,
                fontWeight: FontWeight.bold, fontFamily: "Adelle"),
          )
        ],
      ),
    );
  }
}
