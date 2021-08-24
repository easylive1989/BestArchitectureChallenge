import "package:best_architecture_challenge/domain/entity/post.dart";
import "package:best_architecture_challenge/domain/entity/sort_type.dart";
import "package:best_architecture_challenge/domain/exception/post_read_failed_exception.dart";
import "package:best_architecture_challenge/domain/use_case/post_service.dart";
import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:injectable/injectable.dart";

part "post_state.dart";

@injectable
class PostCubit extends Cubit<PostState> {
  final PostService _postService;

  PostCubit({required PostService postService})
      : _postService = postService,
        super(PostInitial());

  Future fetch(SortType sortType) async {
    emit(PostLoadInProgress());
    try {
      emit(PostLoadSuccess(await _postService.fetch(sortType)));
    } on PostReadFailedException catch (_) {
      emit(PostLoadFailure(sortType));
    }
  }

  Future reload() async {
    if (state is PostLoadFailure) {
      await fetch((state as PostLoadFailure).sortType);
    }
  }
}
