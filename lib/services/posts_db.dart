import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'models/post_model.dart';


class PostDatabase {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;


  Future<void> createPost(String post) async {
    try {
      // Get the current user's ID from Firebase Auth
      final currentUser = FirebaseAuth.instance.currentUser;
      final userId = currentUser?.uid;
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      // Create the post document with the provided string and current timestamp
      final postDocument = FirebaseFirestore.instance.collection('posts').doc();
      final createdAt = DateTime.now();
      final Post _post = Post.fromMap();
      await postDocument.set({
        'userId': userId,
        'post': post,
        'createdAt': createdAt,
      });

      // Create the likes collection for the post document
      await postDocument.collection('likes').doc('count').set({'count': 0});

    } catch (e) {
      print('Error creating post: $e');
      rethrow;
    }
  }

  // Future<void> createPost(Post post) async {
  //   final docRef = _db.collection('posts').doc();
  //   final postId = docRef.id;
  //   // post.id = postId;
  //   // post.userId = userId;
  //   await docRef.set(post.toMap());
  //
  //   // Update user's posts count
  //   final userDocRef = _db.collection('users').doc(userId);
  //   final userDoc = await userDocRef.get();
  //   final int postsCount = userDoc['postsCount'] ?? 0;
  //   await userDocRef.update({
  //     'postsCount': postsCount + 1,
  //   });
  // }

//   Future<List<Post>> getPosts() async {
//     final querySnapshot = await _db.collection('posts').get();
//     // final posts = querySnapshot.docs.map((doc) => Post.fromMap(doc.data())).toList();
//
//     // Fetch likes count for each post
//     // for (final post in posts) {
//     //   // post.likeCount = await _db.collection('posts').doc(post.id).collection('likes').get().then((querySnapshot) => querySnapshot.size);
//     // }
//     //
//     // return posts;
//   }
//
//   Stream<List<Post>> streamPosts() {
//     return _db.collection('posts').snapshots().map((querySnapshot) {
//       final posts = querySnapshot.docs.map((doc) => Post.fromMap(doc.data())).toList();
//       //
//       // // Fetch likes count for each post
//       // for (final post in posts) {
//       //   // post.likeCount = doc.reference.collection('likes').snapshots().map((querySnapshot) => querySnapshot.size);
//       // }
//       //
//       return posts;
//     });
//   }
//
//   Future<Post?> getPostById(String postId) async {
//     final docSnapshot = await _db.collection('posts').doc(postId).get();
//     if (docSnapshot.exists) {
//       // final post = Post.fromMap(docSnapshot.data());
//       // post.likeCount = await _db.collection('posts').doc(postId).collection('likes').get().then((querySnapshot) => querySnapshot.size);
//       // return post;
//     }
//     return null;
//   }
//
//   Future<void> updatePost(Post post) async {
//     await _db.collection('posts').doc(post.id).update(post.toMap());
//   }
//
//   Future<void> deletePost(Post post) async {
//     await _db.collection('posts').doc(post.id).delete();
//
//     // Update user's posts count
//     final userDocRef = _db.collection('users').doc(post.userId);
//     final userDoc = await userDocRef.get();
//     final int postsCount = userDoc['postsCount'] ?? 0;
//     await userDocRef.update({
//       'postsCount': postsCount - 1,
//     });
//
//     // Delete post image from storage
//     if (post.imageUrl != null) {
//       final storageRef = _storage.ref().child(post.imageUrl);
//       await storageRef.delete();
//     }
//   }
// }
