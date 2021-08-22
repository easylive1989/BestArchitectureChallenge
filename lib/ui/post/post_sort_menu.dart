import 'package:best_architecture_challenge/bloc/post/post_cubit.dart';
import 'package:best_architecture_challenge/domain/entity/sort_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostSortMenu extends StatelessWidget {
  const PostSortMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text('使用id排序'),
          key: ValueKey("menu_sort_by_id"),
          value: SortType.ById,
        ),
        PopupMenuItem(
          child: Text('使用title排序'),
          key: ValueKey("menu_sort_by_title"),
          value: SortType.ByTitle,
        )
      ],
      onSelected: (SortType sortType) {
        context.read<PostCubit>().fetch(sortType);
      },
    );
  }
}
