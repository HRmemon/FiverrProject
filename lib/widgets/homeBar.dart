import 'package:VEmbrace/room/rooms.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:VEmbrace/user/userProfile.dart';
import 'package:VEmbrace/main.dart';
import 'package:VEmbrace/user/login.dart';

// cop app bar widget from main.dart
class HomeBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      // centerTitle: true,
      backgroundColor: Color(0xFF880E4F),
      automaticallyImplyLeading: false,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RoomsList()),
            );
          },
          child: const Text(
            "VEMBRACE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              letterSpacing: 1.1,
            ),
          ),
        ),
        const SizedBox(
          width: 140.0,
        ),
        // title: const Padding(
        //   padding: EdgeInsets.fromLTRB(0, 4.0, 3.0, 4.0),
        //   child: Text(
        //     "Study Buddy",
        //     style: TextStyle(
        //       color: Color.fromARGB(255, 255, 255, 255),
        //       fontSize: 25,
        //     ),
        //   ),
        // ),
        // backgroundColor: const Color(0xFF51546e),
        // actions: [
        IconButton(
          onPressed: () {
            // if loggedIn {
            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(builder: (context) => Login()),
            //   );
            // }
            // else {
            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(builder: (context) => Profile()),
            //   );
            // }
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Login()));
          },
          icon: const Icon(Icons.person_rounded),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
