import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:best_architecture_challenge/ui/post/post_card.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  final List<Post> _posts;

  const PostListView({
    Key? key,
    required List<Post> posts,
  })  : _posts = posts,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        return PostCard(
          post: _posts[index],
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
