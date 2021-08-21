import 'package:best_architecture_challenge/domain/bloc/post_cubit.dart';
import 'package:best_architecture_challenge/ui/post/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final PostCubit postCubit;

  MyApp(this.postCubit);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: postCubit,
      child: MaterialApp(
        title: 'MyApp',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: PostPage(title: 'FlutterTaipei :)'),
      ),
    );
  }
}
