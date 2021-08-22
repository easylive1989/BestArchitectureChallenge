import 'package:best_architecture_challenge/app/injection.dart';
import 'package:best_architecture_challenge/ui/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'bloc/post_cubit.dart';

void main() async {
  configureInjection();
  runApp(MyApp(getIt<PostCubit>()));
}

Future dispose() async {
  await GetIt.I.reset(dispose: true);
}
