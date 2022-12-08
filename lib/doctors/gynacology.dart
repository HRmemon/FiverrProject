import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:VEmbrace/doctors/doctor_profiles/doctor_profile.dart';

class Gynacology extends StatelessWidget {
  const Gynacology({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFC8D8D),
        title: const Text(
          "GYNACOLOGY",
          style: TextStyle(
            letterSpacing: 1.2,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 7.5),
          child: Column(
            children: const [
              SizedBox(
                height: 15,
              ),
              DoctorCard(
                name: "Dr. Hira Zuberi",
                stars: 5,
              ),
              DoctorCard(
                name: "Dr. Isma Hasan",
                stars: 2,
              ),
              DoctorCard(
                name: "Dr. Abdul Samad",
                stars: 1,
              ),
              DoctorCard(
                name: "Kiran Nayab",
                stars: 8,
              ),
              DoctorCard(
                name: "Mustafa Madraswala",
                stars: 5,
              ),
              DoctorCard(
                name: "Mehdi IDK",
                stars: 0,
              ),
              DoctorCard(
                name: "Abdullah Fareed",
                stars: 3,
              ),
              DoctorCard(
                name: "Bilal Fayaz 1",
                stars: 1,
              ),
              DoctorCard(
                name: "Bilal Fayaz 2",
                stars: 4,
              ),
              DoctorCard(
                name: "Bilal Fayaz 3",
                stars: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final int stars;

  const DoctorCard({Key? key, required this.name, required this.stars})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DoctorProfile(
                        name: name,
                        joined: "12 April 2022",
                        stars: stars,
                        bio:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/default.png"),
                      radius: 28,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.5,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.star_border_outlined,
                              color: Color(0xFFFC8D8D),
                              size: 21,
                            ),
                            Icon(
                              Icons.star_border_outlined,
                              color: Color(0xFFFC8D8D),
                              size: 21,
                            ),
                            Icon(
                              Icons.star_border_outlined,
                              color: Color(0xFFFC8D8D),
                              size: 21,
                            ),
                            Icon(
                              Icons.star_border_outlined,
                              color: Color(0xFFFC8D8D),
                              size: 21,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
