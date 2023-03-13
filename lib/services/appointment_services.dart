import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/appointment_model.dart';

class AppointmentService {
  final CollectionReference _appointmentsCollectionRef =
      FirebaseFirestore.instance.collection('appointments');

  Future<void> setAppointment(String userId, String doctorId, DateTime date,
      String name, String purpose, String doctor_name) async {
    final appointmentId = _appointmentsCollectionRef.doc().id;
    final appointment = Appointment(
        doctor_name: doctor_name,
        id: appointmentId,
        userId: userId,
        doctorId: doctorId,
        date: date,
        name: name,
        purpose: purpose);
    await _appointmentsCollectionRef
        .doc(appointmentId)
        .set(appointment.toMap());
  }

  Future<List<Appointment>> getAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    final snapshot = await _appointmentsCollectionRef
        .where('userId', isEqualTo: userId)
        .get();
    print(snapshot.docs.first.data());
    return snapshot.docs
        .map((doc) => Appointment.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Appointment>> getDoctorAppointments(String doctorId) async {
    final snapshot = await _appointmentsCollectionRef
        .where('doctorId', isEqualTo: doctorId)
        .get();
    return snapshot.docs
        .map((doc) => Appointment.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
