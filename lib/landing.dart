import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:VEmbrace/doctors/doctors.dart';
import 'package:VEmbrace/forums/forum_landing.dart';
import 'package:VEmbrace/health_mart/health_mart.dart';
import 'package:VEmbrace/my_calendar/my_calendar.dart';
import 'package:VEmbrace/widgets/homeBar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFC8D8D),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                color: Color.fromARGB(255, 0, 0, 0),
                Icons.menu,
                size: 30.0,
              ),
            ),
            const SizedBox(
              width: 34,
            ),
            Image.asset(
              "assets/appbar.png",
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Card(
                          child: SizedBox(
                            height: 95,
                            child: Image.asset(
                              "assets/vembrace.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 235.0,
                        width: 145.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ForumLanding()));
                          },
                          clipBehavior: Clip.antiAlias,
                          style: ElevatedButton.styleFrom(
                              elevation: 10.0,
                              shadowColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: EdgeInsets.zero),
                          child: Image.asset(
                            "assets/ForumButtom.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.5, 5.0, 0.0, 0.0),
                            child: SizedBox(
                              height: 150,
                              width: 160,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DoctorsLanding()));
                                  },
                                  clipBehavior: Clip.antiAlias,
                                  style: ElevatedButton.styleFrom(
                                    elevation: 10.0,
                                    shadowColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Image.asset(
                                    'assets/DocButton.png',
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.5, 7.0, 0.0, 0.0),
                            child: SizedBox(
                              height: 70,
                              width: 160,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  clipBehavior: Clip.antiAlias,
                                  style: ElevatedButton.styleFrom(
                                    elevation: 10.0,
                                    padding: EdgeInsets.zero,
                                    shadowColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/PeriodTrackerButton.png',
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 7.0, 0.0, 0.0),
                        child: SizedBox(
                          height: 70,
                          width: 145,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const MyCalendar()));
                              },
                              clipBehavior: Clip.antiAlias,
                              style: ElevatedButton.styleFrom(
                                elevation: 10.0,
                                padding: EdgeInsets.zero,
                                shadowColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Image.asset(
                                'assets/MyCalenderButton.png',
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12.5, 7.0, 0.0, 0.0),
                        child: SizedBox(
                          height: 70,
                          width: 160,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const HealthMart()));
                              },
                              clipBehavior: Clip.antiAlias,
                              style: ElevatedButton.styleFrom(
                                elevation: 10.0,
                                padding: EdgeInsets.zero,
                                shadowColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Image.asset(
                                'assets/HealthMartButton.png',
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      color: Color.fromARGB(15, 255, 0, 0),
                      height: 220.0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "UPCOMING CALENDER DATES",
                                  //add line
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.7),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
