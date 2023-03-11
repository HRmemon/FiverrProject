import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/post_model.dart';

class CommentDatabase {

  Future<void> addCommentToPost(String postId, String content) async {
    final prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('user_name')!;
    String userId = prefs.getString('userId')!;
    String imageUrl = prefs.getString('user_image_url')!;
    if (userId ==null) return;

    final postRef = FirebaseFirestore.instance.collection('posts').doc(postId);

    final commentData = {
      'content': content,
      'userId': userId,
      'name': name,
      'imageUrl': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
    };

    final Comment _comment = Comment.fromMap(commentData);
    print("Adding comment to $postId : $commentData");
    await postRef.collection('comments').add(_comment.toMap());
  }


  Future<List<Comment>> getCommentsForPost(String postId) async {

    // final currentUser = FirebaseAuth.instance.currentUser;
    // if (currentUser == null) return;
    // final userId = currentUser?.uid;
    final postRef = FirebaseFirestore.instance.collection('posts').doc(postId);
    final comments = await postRef.collection('comments')
        .orderBy('createdAt', descending: true)
        .get();

    final List<Comment> commentList = [];

    for (final comment in comments.docs) {

      commentList.add(Comment(
        content: comment.data()['content'],
        userId: comment.data()['userId'],
        name: comment.data()['name'],
        imageUrl: comment.data()['imageUrl'],
        createdAt: comment.data()['createdAt'],
      ));
    }
    return commentList;
  }
}

