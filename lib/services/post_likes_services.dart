
import 'package:cloud_firestore/cloud_firestore.dart';

class LikeDatabase {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> likePost(String postId, String userId) async {
    await _db.collection('posts').doc(postId).collection('likes').doc(userId).set({
      'likedAt': DateTime.now(),
    });
  }

  Future<void> unlikePost(String postId, String userId) async {
    await _db.collection('posts').doc(postId).collection('likes').doc(userId).delete();
  }

  Stream<int> getLikesCount(String postId) {
    return _db.collection('posts').doc(postId).collection('likes').snapshots().map((snap) => snap.size);
  }

  Future<bool> isPostLikedByUser(String postId, String userId) async {
    final doc = await _db.collection('posts').doc(postId).collection('likes').doc(userId).get();
    return doc.exists;
  }
}
