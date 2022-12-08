import 'package:flutter/material.dart';

class HealthMart extends StatefulWidget {
  const HealthMart({Key? key}) : super(key: key);

  @override
  State<HealthMart> createState() => _HealthMartState();
}

class _HealthMartState extends State<HealthMart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFC8D8D),
        title: const Text(
          "HEALTH MART",
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
                name: "Item 1",
                stars: 5,
              ),
              DoctorCard(
                name: "Item 2",
                stars: 2,
              ),
              DoctorCard(
                name: "Item 3",
                stars: 1,
              ),
              DoctorCard(
                name: "Item 4",
                stars: 8,
              ),
              DoctorCard(
                name: "Item 5",
                stars: 5,
              ),
              DoctorCard(
                name: "Item 6",
                stars: 0,
              ),
              DoctorCard(
                name: "Item 7",
                stars: 3,
              ),
              DoctorCard(
                name: "Item 8",
                stars: 1,
              ),
              DoctorCard(
                name: "Item 9",
                stars: 4,
              ),
              DoctorCard(
                name: "Item 10",
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
              onPressed: () {},
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
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.5,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.0,
                      ),
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
