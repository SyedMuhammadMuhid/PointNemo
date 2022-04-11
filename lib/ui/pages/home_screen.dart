import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:point_nemo/ui/widgets/bounce_avatar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List SideBar = ["", "", "", "", ""];
  List Bar = ["", "", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
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
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0,
                                                          right: 8,
                                                          top: 25,
                                                          bottom: 8),
                                                  child: Avatar()),
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
}
