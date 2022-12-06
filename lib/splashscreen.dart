import 'package:VEmbrace/simplelogin/components/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _coffeeController;
  bool copAnimated = false;
  bool animateCafeText = true;

  @override
  void initState() {
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {
      if (_coffeeController.value > 0.7) {
        _coffeeController.stop();
        copAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          animateCafeText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _coffeeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 130, 172),
      body: Stack(
        children: [
          // White Container top half
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            height: copAnimated ? screenHeight / 1 : screenHeight,
            decoration: BoxDecoration(
              color: Color(0xFFFCE4EC),
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(copAnimated ? 40.0 : 0.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !copAnimated,
                  child: Lottie.asset(
                    // 'assets/coffeesplash.json',
                    'assets/handSplash.json',
                    controller: _coffeeController,
                    onLoaded: (composition) {
                      // navigator to home screen
                      _coffeeController
                        ..duration = composition.duration
                        ..forward();

                      // _coffeeController
                      //   ..duration = composition.duration
                      //   ..forward();
                    },
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // Visibility(
                //   visible: copAnimated,
                //   child: Image.asset(
                //     'assets/DocButton.png',
                //     height: 190.0,
                //     width: 190.0,
                //   ),
                // ),
                Center(
                  child: AnimatedOpacity(
                    opacity: animateCafeText ? 1 : 0,
                    duration: const Duration(seconds: 4),
                    child: Image.asset(
                      'assets/name.png',
                      height: 200.0,
                      width: 200.0,
                    ),
                    //  const Text(
                    //   'C A F É',
                    //   style:
                    //       TextStyle(fontSize: 50.0, color: Color(0xFFF94E4F)),
                    // ),
                    // navigate to home screen
                    onEnd: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    },
                  ),
                  // navigator to home screen
                ),
              ],
            ),
          ),

          // Text bottom part
          // Visibility(visible: copAnimated, child: const _BottomPart()),
        ],
      ),
    );
  }
}

// class _BottomPart extends StatelessWidget {
//   const _BottomPart({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 40.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               'Find The Best Coffee for You',
//               style: TextStyle(
//                   fontSize: 27.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//             const SizedBox(height: 30.0),
//             Text(
//               'Lorem ipsum dolor sit amet, adipiscing elit. '
//               'Nullam pulvinar dolor sed enim eleifend efficitur.',
//               style: TextStyle(
//                 fontSize: 15.0,
//                 color: Colors.white.withOpacity(0.8),
//                 height: 1.5,
//               ),
//             ),
//             const SizedBox(height: 50.0),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Container(
//                 height: 85.0,
//                 width: 85.0,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.white, width: 2.0),
//                 ),
//                 child: const Icon(
//                   Icons.chevron_right,
//                   size: 50.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 50.0),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';

// import 'package:flutter/material.dart';

// import 'room/rooms.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         Duration(seconds: 6),
//         () => Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => HomeScreen())));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ,
//       ),
//     );
//   }
// }
