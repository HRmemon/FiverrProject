import 'package:flutter/material.dart';
import 'package:VEmbrace/doctors/gynacology.dart';
import 'package:VEmbrace/doctors/mental_health.dart';

class DoctorsLanding extends StatelessWidget {
  const DoctorsLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFC8D8D),
        title: const Text(
          "DOCTORS",
          style: TextStyle(
            letterSpacing: 1.2,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CHOOSE SPECIALIST",
                  style: TextStyle(
                    color: Colors.red[500],
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 108,
                  width: 125,
                  child: ElevatedButton(
                    clipBehavior: Clip.antiAlias,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Gynacology()));
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        shadowColor: Colors.red,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: Image.asset(
                      'assets/gyna.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 108,
                  width: 125,
                  child: ElevatedButton(
                    clipBehavior: Clip.antiAlias,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MentalHealth()));
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        shadowColor: Colors.red,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: Image.asset(
                      'assets/mental.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
