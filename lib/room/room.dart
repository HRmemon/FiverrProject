import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VEmbrace/user/login.dart';
import 'package:VEmbrace/main.dart';
import 'package:VEmbrace/user/userProfile.dart';
import 'package:VEmbrace/room/createRoom.dart';
import 'package:VEmbrace/widgets/homeBar.dart';
// import 'lib/room/room.dart';

class Room extends StatelessWidget {
  Room({Key? key, required this.index}) : super(key: key);

  TextEditingController message = TextEditingController();

  final int index;

  @override
  Widget build(BuildContext context) {
    List data = rooms[index];
    return Scaffold(
      backgroundColor: Color(0xFFF1A0BB),
      body: SafeArea(
        child: Center(
          child: ListView(children: [
            const HomeBar(),
            const SizedBox(
              height: 35.0,
              width: 300.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFF2D2D39)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFC2185B),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: const Color(0xFFC2185B),
                            width: 1.0,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        height: 40,
                        width: 360,
                        // margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        // set margin to left side
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.meeting_room,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "STUDY ROOM",
                            style: TextStyle(
                              fontSize: 15.0,
                              letterSpacing: 1.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // add a square box to keep in the background with color and i can add rows in it
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 6.0, 15.0, 20.0),
                        child: Text(
                          data[0],
                          style: const TextStyle(
                            fontSize: 25.0,
                            color: Color(0xFFC2185B),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // add text left side
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 6.0, 15.0, 20.0),
                        child: Text(
                          "HOSTED BY",
                          style: const TextStyle(
                            fontSize: 13.0,
                            color: Color(0xFFC2185B),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 20.0),
                      const Icon(
                        Icons.person_rounded,
                        color: Color(0xFFC2185B),
                        size: 25.0,
                      ),
                      const SizedBox(
                        width: 9.0,
                      ),
                      Text(
                        "@${data[3]}",
                        style: const TextStyle(
                          color: Color(0xFFC2185B),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 6.0, 15.0, 20.0),
                        child: Text(
                          data[2],
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFFC2185B),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFC2185B),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: const Color(0xFFC2185B),
                            width: 1.0,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        height: 25,
                        width: 90,
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        // center the text
                        child: Center(
                          child: Text(
                            "${data[1]}",
                            style: const TextStyle(
                              fontSize: 15.0,
                              letterSpacing: 1.0,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // add text box for topic in the middle center aligned
                  const SizedBox(height: 10.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFC2185B),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0xFFC2185B),
                            width: 1.0,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        height: 25,
                        width: 90,
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        // center the text
                        child: Center(
                          child: Text(
                            "CHAT",
                            style: const TextStyle(
                              fontSize: 15.0,
                              letterSpacing: 1.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Row(
                  //   children: [
                  //     Padding(
                  //         padding:
                  //             const EdgeInsets.fromLTRB(20.0, 6.0, 15.0, 20.0),
                  //         child: Center(
                  //           child: Text(
                  //             "MEMBERS",
                  //             style: const TextStyle(
                  //               fontSize: 13.0,
                  //               color: Color(0xFFb2bdbd),
                  //               fontWeight: FontWeight.w400,
                  //             ),
                  //           ),
                  //         )),
                  //   ],
                  // ),
                  // const SizedBox(height: 35.0),
                  Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D2D39),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: const Color(0xFF2D2D39),
                          width: 1.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                      ),
                      height: 500,
                      width: 340,
                      margin: const EdgeInsets.symmetric(horizontal: 0.0),
                      // center the text on top of container
                      child: Column(children: [
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 20.0),
                            // vertical line
                            Container(
                              height: 30,
                              width: 2,
                              color: const Color(0xFF696d97),
                            ),
                            const SizedBox(width: 20.0),
                            const Icon(
                              Icons.person_rounded,
                              color: Color(0xFFC2185B),
                              size: 25.0,
                            ),
                            const SizedBox(
                              width: 9.0,
                            ),
                            Text(
                              "@${data[3]}",
                              style: const TextStyle(
                                color: Color(0xFFC2185B),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        ),
                        //
                      ]))
                ],
              ),
            ),
            Container(
              height: 45.0,
              child: TextFormField(
                controller: message,
                decoration: const InputDecoration(
                  hoverColor: Colors.white,
                  hintText: "Write something about yourself",
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFC2185B), width: 1)),
                  // enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(
                  //         color: Color(0xFFC2185B), width: 1)),
                ),
              ),
            ),
            // add text input field
          ]),
        ),
      ),
    );
  }
}
