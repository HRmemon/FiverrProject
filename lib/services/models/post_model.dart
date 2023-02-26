import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String userId;
  final String name;
  final String imageUrl;
  final String content;
  final Timestamp timestamp;

  Post({
    required this.userId,
    required this.name,
    required this.imageUrl,
    required this.content,
    required this.timestamp,
  });

  factory Post.fromMap(Map<String, dynamic> data) {
    final Timestamp timestamp = data['timestamp'] ?? Timestamp.now();
    return Post(
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      content: data['content'] ?? '',
      timestamp: timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'imageUrl': imageUrl,
      'content': content,
      'timestamp': timestamp,
    };
  }
}

class Comment {
  final String userId;
  final String name;
  final String imageUrl;
  final String content;
  final Timestamp timestamp;

  Comment({
    required this.userId,
    required this.name,
    required this.imageUrl,
    required this.content,
    required this.timestamp,
  });

  factory Comment.fromMap(Map<String, dynamic> data, String id) {
    final Timestamp timestamp = data['timestamp'] ?? Timestamp.now();
    return Comment(
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      content: data['content'] ?? '',
      timestamp: timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'imageUrl': imageUrl,
      'content': content,
      'timestamp': timestamp,
    };
  }
}
