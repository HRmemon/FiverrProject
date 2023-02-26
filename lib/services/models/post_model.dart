import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String userId;
  final String name;
  final String imageUrl;
  final String content;
  final Timestamp createdAt;

  Post({
    required this.userId,
    required this.name,
    required this.imageUrl,
    required this.content,
    required this.createdAt,
  });

  factory Post.fromMap(Map<String, dynamic> data) {
    final Timestamp createdAt = data['timestamp'] ?? Timestamp.now();
    return Post(
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      content: data['content'] ?? '',
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'imageUrl': imageUrl,
      'content': content,
      'createdAt': createdAt,
    };
  }
}

class Comment {
  final String userId;
  final String name;
  final String imageUrl;
  final String content;
  final Timestamp createdAt;

  Comment({
    required this.userId,
    required this.name,
    required this.imageUrl,
    required this.content,
    required this.createdAt,
  });

  factory Comment.fromMap(Map<String, dynamic> data, String id) {
    final Timestamp createdAt = data['timestamp'] ?? Timestamp.now();
    return Comment(
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      content: data['content'] ?? '',
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'imageUrl': imageUrl,
      'content': content,
      'createdAt': createdAt,
    };
  }
}
