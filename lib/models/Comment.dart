import 'package:flutter_native_interaction/models/User.dart';

class Comment {
  final int id;
  final String comment;
  final User user;

  Comment({this.id, this.comment, this.user});

  factory Comment.fromJson(Map<String, dynamic> data) {
    return Comment(
      id: data['id'],
      comment: data['comment'],
      user: User.fromJson(data['user']),
    );
  }
}
