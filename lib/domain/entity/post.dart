import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(post) {
    return Post(
      userId: post['userId'],
      id: post['id'],
      title: post["title"],
      body: post["body"],
    );
  }

  @override
  List<Object?> get props => [id];
}
