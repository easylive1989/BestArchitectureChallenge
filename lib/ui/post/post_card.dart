import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Post _post;

  const PostCard({
    Key? key,
    required Post post,
  })  : _post = post,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: "${_post.id.toString()}. ${_post.title}",
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            TextSpan(
              text: '\n' + _post.body,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
