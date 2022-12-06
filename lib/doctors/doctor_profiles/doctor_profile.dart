import 'package:flutter/material.dart';
import 'package:VEmbrace/doctors/appointment/book_appointment.dart';

class DoctorProfile extends StatelessWidget {
  final String name;
  final String joined;
  final int stars;
  final String bio;

  const DoctorProfile(
      {Key? key,
      required this.name,
      required this.joined,
      required this.stars,
      required this.bio})
      : super(key: key);

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
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/DocButton.png"),
                                radius: 35,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "$name",
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const Text(
                                      "Qualification: Doctor of all things doctor-y",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            bio,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: const Divider(
                              thickness: 1,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "RATING",
                            style: TextStyle(
                              fontSize: 22.5,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.star_border_outlined,
                                color: Color(0xFFFC8D8D),
                                size: 18,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: Color(0xFFFC8D8D),
                                size: 18,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: Color(0xFFFC8D8D),
                                size: 18,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: Color(0xFFFC8D8D),
                                size: 18,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: Color(0xFFFC8D8D),
                                size: 18,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "(2 reviews)",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 170,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 7.5, 5),
                                    child: SizedBox(
                                      width: 180.0,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFFCE4EC),
                                        ),
                                        onPressed: () {},
                                        child: const Center(
                                          child: Text(
                                            "Review 1",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                    child: SizedBox(
                                      width: 180.0,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFFCE4EC),
                                        ),
                                        onPressed: () {},
                                        child: const Center(
                                          child: Text(
                                            "Review 2",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const BookAppointment()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFC8D8D),
                                ),
                                child: const Text(
                                  "BOOK APPOINTMENT",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
