class Appointment {
  final String id;
  final String userId;
  final String doctorId;
  final DateTime date;
  final String name;
  final String purpose;

  Appointment(
      {required this.name,
      required this.purpose,
      required this.id,
      required this.userId,
      required this.doctorId,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'doctorId': doctorId,
      'date': date,
      'name': name,
      'purpose': purpose,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'],
      userId: map['userId'],
      doctorId: map['doctorId'],
      date: map['date'].toDate(),
      name: map['name'].toDate(),
      purpose: map['purpose'].toDate(),
    );
  }
}
