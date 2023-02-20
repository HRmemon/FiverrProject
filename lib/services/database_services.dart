import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import 'authentication_servies.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user, File? image) async {
    if (image != null) {
      String fileName = basename(image.path);
      Reference storageRef = FirebaseStorage.instance.ref().child('user_images/$fileName');
      UploadTask uploadTask = storageRef.putFile(image);
      await uploadTask.whenComplete(() async {
        String downloadUrl = await storageRef.getDownloadURL();
        user.imageUrl = downloadUrl;
      });
    }
    print(user.uid);
    print(user.imageUrl);
    return await _db.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<UserModel?> getUser(String uid) async {
    DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data() as Map<String, dynamic>, uid);
    } else {
      return null;
    }
  }
}
