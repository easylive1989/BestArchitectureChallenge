import 'package:best_architecture_challenge/bloc/post_cubit.dart';
import 'package:best_architecture_challenge/domain/entity/sort_type.dart';
import 'package:best_architecture_challenge/ui/post/post_list_view.dart';
import 'package:best_architecture_challenge/ui/post/post_sort_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  final String title;

  PostPage({Key? key, required this.title}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostCubit>().fetch(SortType.ById);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          PostSortMenu(),
        ],
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoadSuccess) {
            return PostListView(posts: state.posts);
          }
          if (state is PostLoadFailure) {
            return Center(
              child: ElevatedButton(
                child: Text("Reload"),
                onPressed: () => context.read<PostCubit>().reload(),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
