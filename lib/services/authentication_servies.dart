import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'database_services.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String contactNo;
  String? imageUrl;

  UserModel({required this.uid, required this.name, required this.email, required this.contactNo, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'contactNo': contactNo,
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String uid) {
    return UserModel(
      uid: uid,
      name: map['name'],
      email: map['email'],
      contactNo: map['contactNo'],
      imageUrl: map['imageUrl'],
    );
  }
}

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}

class AuthenticationService {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final DatabaseService _databaseService = DatabaseService();

  // Stream<UserModel?> get user {
  //   return _firebaseAuthService.authStateChanges.map((user) => user != null ? _databaseService.getUser(user.uid) : null);
  // }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await _firebaseAuthService.signInWithEmailAndPassword(email, password);
  }

  Future<UserModel> createUserWithEmailAndPassword({required String email, required String password, required String name, required String contactNo, File? image}) async {
    UserCredential authResult = await _firebaseAuthService.createUserWithEmailAndPassword(email, password);
    UserModel user = UserModel(
      uid: authResult.user!.uid,
      name: name,
      email: email,
      contactNo: contactNo,
      imageUrl: '',
    );
    await _databaseService.createUser(user, image);
    return user;
  }

  Future<void> signOut() async {
    return await _firebaseAuthService.signOut();
  }
}
