import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/appointment_model.dart';

class AppointmentService {
  final CollectionReference _appointmentsCollectionRef =
      FirebaseFirestore.instance.collection('appointments');

  Future<void> setAppointment(String userId, String doctorId, DateTime date,
      String name, String purpose) async {
    final appointmentId = _appointmentsCollectionRef.doc().id;
    final appointment = Appointment(
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

  Future<List<Appointment>> getAppointments(String userId) async {
    final snapshot = await _appointmentsCollectionRef
        .where('userId', isEqualTo: userId)
        .get();
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
