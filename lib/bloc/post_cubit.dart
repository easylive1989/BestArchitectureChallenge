import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:best_architecture_challenge/domain/entity/sort_type.dart';
import 'package:best_architecture_challenge/domain/use_case/post_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'post_state.dart';

@injectable
class PostCubit extends Cubit<PostState> {
  PostService _postService;

  PostCubit({required PostService postService})
      : _postService = postService,
        super(PostInitial());

  Future fetch(SortType sortType) async {
    emit(PostLoadInProgress());
    emit(PostLoadSuccess(await _postService.fetch(sortType)));
  }
}
