import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:VEmbrace/user/login.dart';
import 'package:VEmbrace/user/reg.dart';
import 'package:VEmbrace/room/createRoom.dart';
import 'room/createRoom.dart';
import 'package:VEmbrace/widgets/homeBar.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D39),
      body: SafeArea(
        child: Column(
          children: [
            const HomeBar(),
            // Container(
            //   color: Color(0xFF51546e),
            //   height: 57.0,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       // IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            //       Flexible(
            //         child: Container(
            //           width: 200,
            //           height: 60,
            //           child: TextButton.icon(
            //             style: TextButton.styleFrom(
            //               elevation: 0.0,
            //               backgroundColor: const Color(0xFF51546e),
            //             ),
            //             onPressed: () {
            //               Navigator.of(context).push(MaterialPageRoute(
            //                   builder: (context) => HomeBar()));
            //             },
            //             icon: const Icon(
            //               Icons.home,
            //               color: Color(0xFF51546e),
            //             ),
            //             label: const Padding(
            //               padding: EdgeInsets.fromLTRB(0, 4.0, 3.0, 4.0),
            //               child: Text(
            //                 "Study Buddy",
            //                 style: TextStyle(
            //                   color: Color.fromARGB(255, 255, 255, 255),
            //                   fontSize: 25,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       IconButton(
            //         onPressed: () {
            //           Navigator.of(context).push(
            //               MaterialPageRoute(builder: (context) => Login()));
            //         },
            //         icon: const Icon(Icons.person_rounded),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFEC407A),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 11.0, horizontal: 10.0),
                          margin:
                              const EdgeInsets.fromLTRB(7.0, 22.0, 7.0, 1.0),
                          // create a search bar to search for rooms
                          child: Row(
                            children: const [
                              Icon(Icons.search_rounded,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              SizedBox(width: 5.0),
                              Text(
                                "Search for posts/rooms",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Flexible(
                  //       child: Container(
                  //         width: 140.0,
                  //         height: 34.0,
                  //         decoration: BoxDecoration(
                  //           color: const Color(0xFF2D2D39),
                  //           shape: BoxShape.rectangle,
                  //           border: Border.all(
                  //             color: const Color(0xFF6BB8CF),
                  //             width: 1.0,
                  //           ),
                  //           borderRadius:
                  //               const BorderRadius.all(Radius.circular(20)),
                  //         ),
                  //         child: TextButton(
                  //             onPressed: () {},
                  //             child: const Text(
                  //               "Browse Topic",
                  //               style: TextStyle(
                  //                 color: Color(0xFF6BB8CF),
                  //                 fontSize: 12.5,
                  //                 letterSpacing: 1.0,
                  //               ),
                  //             )),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 8.0),
                  //     Flexible(
                  //       child: Container(
                  //         width: 140.0,
                  //         height: 34.0,
                  //         decoration: BoxDecoration(
                  //           color: const Color(0xFF2D2D39),
                  //           shape: BoxShape.rectangle,
                  //           border: Border.all(
                  //             color: const Color(0xFF6BB8CF),
                  //             width: 1.0,
                  //           ),
                  //           borderRadius:
                  //               const BorderRadius.all(Radius.circular(20)),
                  //         ),
                  //         child: TextButton(
                  //             onPressed: () {},
                  //             child: const Text(
                  //               "Recent Activity",
                  //               style: TextStyle(
                  //                   color: Color(0xFF6BB8CF),
                  //                   fontSize: 12.5,
                  //                   letterSpacing: 1.0),
                  //             )),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 30.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "VEMBRACE ROOM(s)",
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 14.5,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "1 Room(s) available",
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 12.0,
                                  color: Color(0xFFF48FB1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Container(
                            width: 140,
                            height: 40,
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                elevation: 3.0,
                                backgroundColor: Color(0xFFEC407A),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CreateRoom()));
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              label: const Padding(
                                padding: EdgeInsets.fromLTRB(0, 4.0, 3.0, 4.0),
                                child: Text(
                                  "Create Room",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 1.0),
                child: ListView.builder(
                  itemCount: rooms.length,
                  itemBuilder: (context, i) {
                    return RoomCard(index: i);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
