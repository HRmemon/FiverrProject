class Appointment {
  final String id;
  final String userId;
  final String doctorId;
  final DateTime date;
  final String name;
  final String purpose;
  final String doctor_name;

  Appointment(
      {required this.name,
      required this.purpose,
      required this.id,
      required this.userId,
      required this.doctorId,
      required this.date,
      required this.doctor_name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'doctorId': doctorId,
      'date': date,
      'name': name,
      'purpose': purpose,
      'doctor_name': doctor_name,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'],
      userId: map['userId'],
      doctorId: map['doctorId'],
      date: map['date'].toDate(),
      name: map['name'],
      purpose: map['purpose'],
      doctor_name: map['doctor_name'],
    );
  }
}
