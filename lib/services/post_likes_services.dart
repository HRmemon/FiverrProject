import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LikeDatabase {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> likePost(String postId, String userId) async {
    try {
      await _db
          .collection('posts')
          .doc(postId)
          .collection('likes')
          .doc(userId)
          .set({
        'likedAt': DateTime.now(),
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> unlikePost(String postId, String userId) async {
    await _db
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userId)
        .delete();
  }

  Stream<int> getLikesCount(String postId) {
    return _db
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .snapshots()
        .map((snap) => snap.size);
  }

  Future<bool> isPostLikedByUser(String postId, String userId) async {
    final doc = await _db
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userId)
        .get();
    return doc.exists;
  }

  likeOrDislike (String postId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;
    final userId = currentUser?.uid;
    bool isLiked = await isPostLikedByUser(postId, userId!);
    if (isLiked) {
      await unlikePost(postId, userId);
      return false;
    } else{
      return await likePost(postId, userId!);
    }

  }
}
