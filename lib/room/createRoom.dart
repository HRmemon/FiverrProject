import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:VEmbrace/main.dart';
import 'package:VEmbrace/room/room.dart';
import 'package:VEmbrace/widgets/homeBar.dart';

List rooms = [];
// Rooms {
//     name
//     topic
//     about
//     creatoruid
//     creatorname
//     numjoined
//}

class CreateRoom extends StatelessWidget {
  CreateRoom({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController topic = TextEditingController();
  TextEditingController about = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D39),
      // appBar: AppBar(
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: const Text(
      //     "CREATE STUDY ROOM",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 15.0,
      //       letterSpacing: 1.1,
      //     ),
      //   ),
      //   backgroundColor: const Color(0xFF696d97),
      // ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const HomeBar(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 35.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "CREATE VEMBRACE ROOM",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 1.1),
                          // fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    const Text(
                      "Room Name",
                      style: TextStyle(
                        fontSize: 13.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFb2bdbd),
                      ),
                    ),
                    const SizedBox(
                      height: 8.5,
                    ),
                    Container(
                      height: 45.0,
                      child: TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFEC407A), width: 1)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Topic",
                      style: TextStyle(
                        fontSize: 13.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFb2bdbd),
                      ),
                    ),
                    const SizedBox(
                      height: 8.5,
                    ),
                    Container(
                      height: 45.0,
                      child: TextFormField(
                        controller: topic,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFEC407A), width: 1)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "About Room",
                      style: TextStyle(
                        fontSize: 13.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFb2bdbd),
                      ),
                    ),
                    const SizedBox(
                      height: 8.5,
                    ),
                    Container(
                      height: 100.0,
                      child: TextFormField(
                        controller: about,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFEC407A), width: 1)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 42,
                          width: 80.0,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shadowColor: Colors.black,
                              backgroundColor: const Color(0xFFF48FB1),
                              elevation: 3.0,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Container(
                          height: 42,
                          width: 120.0,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shadowColor: Colors.black,
                              backgroundColor: const Color(0xFFEC407A),
                              elevation: 3.0,
                            ),
                            onPressed: () {
                              rooms.add([
                                name.text,
                                topic.text,
                                about.text,
                                "mm05548",
                                "Mustafa Madraswala",
                                2
                              ]);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyHomePage()));
                            },
                            child: const Text(
                              "Create Room",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  RoomCard({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final List data = rooms[index];

    return Card(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 23.0),
      color: const Color(0xFFF48FB1),
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              const SizedBox(width: 12.0),
              const Icon(
                Icons.person_rounded,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25.0,
              ),
              const SizedBox(
                width: 9.0,
              ),
              Text(
                "@${data[3]}",
                style: const TextStyle(
                  color: Color(0xFFEC407A),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // children: [
            //   Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Text(
              //   "Haven't signed up yet?",
              //   style: TextStyle(
              //     color: Color(0xFFb2bdbd),
              //     fontSize: 14.0,
              //   ),
              // ),
              SizedBox(
                height: 35.0,
                width: 130.0,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Room(index: index)));
                  },
                  // child: const Text(
                  //   "Sign Up",
                  // child: const Text(
                  // data[0],
                  child: Text(
                    "${data[0]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.5,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
              )
            ],

            // ),
            // ],
          ),

          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(builder: (context) => MyHomePage()),
          //       );
          //     },
          //     child: const Text(
          //       "Study Buddy",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 25.0,
          //         letterSpacing: 1.1,
          //       ),
          //     ),
          //   ),
          // ]

          // children: [
          //   Padding(
          //     padding: const EdgeInsets.fromLTRB(20.0, 6.0, 15.0, 20.0),
          //     child: Text(
          //       data[0],
          //       style: const TextStyle(
          //         fontSize: 18.5,
          //         color: Colors.white,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //   ),
          // ],
          // ),
          const SizedBox(
            height: 5.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 1,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          )
        ],
      ),
    );
  }
}
