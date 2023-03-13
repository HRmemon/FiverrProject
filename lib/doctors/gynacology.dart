import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:VEmbrace/doctors/doctor_profiles/doctor_profile.dart';

import '../services/authentication_servies.dart';

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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7.5),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            //TODO: Add users
            // DoctorCard(
            //   name: "Dr. Hira Zuberi",
            //   stars: 5,
            // ),

            Expanded(
              child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    // .where('role', isEqualTo: 'doctor')
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final doctors = snapshot.data!.docs.map((doc) {
                    final user = UserModel.fromMap(
                        doc.data() as Map<String, dynamic>, doc.id);
                    return DoctorCard(user: user,);
                  }).toList();

                  return ListView(children: doctors, shrinkWrap: true,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {

  final UserModel user;
  const DoctorCard({Key? key, required this.user })
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
user: user,)));
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
                          user.name,
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
