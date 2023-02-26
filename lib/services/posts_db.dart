import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      final prefs = await SharedPreferences.getInstance();
      final name = prefs.getString('user_name');
      final imageUrl = prefs.getString('user_image_url');
      final createdAt = DateTime.now().toUtc().toString(); // UTC timestamp

      final postData = {
        'content': post,
        'name': name ?? '',
        'imageUrl': imageUrl ?? '',
        'createdAt': createdAt,
        "userId": userId,
      };
      final Post _post = Post.fromMap(postData);
      await postDocument.set(_post.toMap());

      // Create the likes collection for the post document
      // await postDocument.collection('likes');
      // await postDocument.collection('comments');
    } catch (e) {
      print('Error creating post: $e');
      rethrow;
    }
  }



  Future<List<Post>> getPosts() async {
    final posts = await FirebaseFirestore.instance
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .get();

    final List<Post> postList = [];

    for (final post in posts.docs) {
      final likes =
      await post.reference.collection('likes').get();

      postList.add(Post(
        postId: post.id,
        content: post.data()['content'],
        userId: post.data()['userId'],
        name: post.data()['name'],
        imageUrl: post.data()['imageUrl'],
        createdAt: post.data()['createdAt'],
        likesCount: likes.docs.length,
      ));
    }

    print("RETURNING ${posts.size} posts");
    return postList;
  }

}
