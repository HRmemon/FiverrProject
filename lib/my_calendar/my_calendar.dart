import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFC8D8D),
        title: const Text(
          "MY CALENDAR",
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
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay:  DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                // Use `selectedDayPredicate` to determine which day is currently selected.
                // If this returns true, then `day` will be marked as selected.

                // Using `isSameDay` is recommended to disregard
                // the time-part of compared DateTime objects.
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Call `setState()` when updating the selected day
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                _focusedDay = focusedDay;
              },
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: const [
                  Text(
                    "UPCOMING EVENTS",
                    //add line
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.7),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7.5,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 7.5, 5),
                        child: SizedBox(
                          width: 180.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFC8D8D),
                            ),
                            onPressed: () {
                            },
                            child: Center(
                              child: Text(
                                "EVENT 1",
                                style: TextStyle(
                                  color: Colors.grey[100],
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 7.5, 5),
                        child: SizedBox(
                          width: 180.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFC8D8D),
                            ),
                            onPressed: () {
                            },
                            child: Center(
                              child: Text(
                                "EVENT 2",
                                style: TextStyle(
                                  color: Colors.grey[100],
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 7.5, 5),
                        child: SizedBox(
                          width: 180.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFC8D8D),
                            ),
                            onPressed: () {
                            },
                            child: Center(
                              child: Text(
                                "EVENT 3",
                                style: TextStyle(
                                  color: Colors.grey[100],
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 7.5, 5),
                        child: SizedBox(
                          width: 180.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFC8D8D),
                            ),
                            onPressed: () {
                            },
                            child: Center(
                              child: Text(
                                "EVENT 4",
                                style: TextStyle(
                                  color: Colors.grey[100],
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
