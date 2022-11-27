import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:VEmbrace/utilities/utilities.dart';
// import widgets package
// import 'package:StatefulWidgetBuilder/widgets.dart';
// import 'package:src/painting/image_provider.dart';
import 'package:flutter/widgets.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:VEmbrace/user/login.dart';
import 'package:VEmbrace/user/reg.dart';
import 'package:VEmbrace/room/createRoom.dart';
import 'package:VEmbrace/widgets/homeBar.dart';

// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _bioController = TextEditingController();
//   bool _isLoading = false;
//   Uint8List? _image;
// make a screen for user profile
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

// Profile({Key? key}) : super(key: key);
class _ProfileScreenState extends State<Profile> {
  Uint8List? _image;
  TextEditingController about = TextEditingController();

  // selectImage() async {
  //   Uint8List im = await pickImage(ImageSource.gallery);
  //   // set state because we need to display the image we selected on the circle avatar
  //   setState(() {
  //     _image = im;
  //   });
  // }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    // use setState() to update the state of the widget
    // update the state of the widget
    // StateSetter setState;
    // setState(() {
    //   _image = im;
    // });
    // _image = im;
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2D39),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const HomeBar(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 117.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 90.0,
                    ),
                    // Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // children: const [
                    Stack(
                      children: [
                        _image != null
                            // create an outline of the circle avatar
                            // ? CircleAvatar(
                            //     radius: 50.0,
                            //     backgroundColor: const Color(0xFF6BB8CF),
                            //     child: CircleAvatar(
                            //       radius: 48.0,
                            //       backgroundImage: MemoryImage(_image!),
                            //     ),
                            //   )
                            // : CircleAvatar(
                            //     radius: 50.0,
                            //     backgroundColor: const Color(0xFF6BB8CF),
                            //     child: CircleAvatar(
                            //       radius: 48.0,
                            //       backgroundImage: NetworkImage(
                            //           'https://i.stack.imgur.com/l60Hf.png'),
                            //     ),
                            //   ),
                            ? CircleAvatar(
                                radius: 67.0,
                                backgroundColor: const Color(0xFF6BB8CF),
                                child: CircleAvatar(
                                  radius: 60.0,
                                  backgroundImage: MemoryImage(_image!),
                                  backgroundColor: Color(0xFF6BB8CF),
                                ))
                            : const CircleAvatar(
                                radius: 67.0,
                                backgroundColor: Color(0xFF6BB8CF),
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      'https://i.stack.imgur.com/l60Hf.png'),
                                ),
                                //   backgroundImage: NetworkImage(
                                //       'https://i.stack.imgur.com/l60Hf.png'),
                                //   backgroundColor: const Color(0xFF6BB8CF),
                              ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(Icons.add_a_photo),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    // ],
                    // ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(
                    //   height: 35.0,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Mustafa Madraswala",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 1.1),
                          // fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "@mustafa",
                          style: TextStyle(
                              color: const Color(0xFFEC407A),
                              fontSize: 15.0,
                              letterSpacing: 1.1),
                          // fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    const Text(
                      "ABOUT",
                      style: TextStyle(
                        fontSize: 15.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFF48FB1),
                      ),
                    ),
                    const SizedBox(
                      height: 8.5,
                    ),
                    Container(
                      height: 45.0,
                      child: TextFormField(
                        controller: about,
                        decoration: const InputDecoration(
                          hoverColor: Colors.white,
                          hintText: "Write something about yourself",
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(
                          //         color: Color(0xFF6BB8CF), width: 1)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    const Text(
                      "STUDY ROOMS HOSTED BY ME",
                      style: TextStyle(
                        fontSize: 15.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFF48FB1),
                      ),
                    ),
                    const SizedBox(
                      height: 8.5,
                    ),

                    // when a room is created, it will be displayed here like a card widget with the room name and the number of people in the room like on the home page
                    // import the room card widget and use it here

                    // Expanded(
                    //   child: Padding(
                    //     padding:
                    //         const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 1.0),
                    //     child: ListView.builder(
                    //       itemCount: rooms.length,
                    //       itemBuilder: (context, i) {
                    //         return RoomCard(index: i);
                    //       },
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
