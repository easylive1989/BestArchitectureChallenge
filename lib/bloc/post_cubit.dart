import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:best_architecture_challenge/domain/entity/sort_type.dart';
import 'package:best_architecture_challenge/domain/repository/post_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'post_state.dart';

@injectable
class PostCubit extends Cubit<PostState> {
  PostRepository _postRepository;

  PostCubit({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(PostInitial());

  Future fetch(SortType sortType) async {
    emit(PostLoadInProgress());
    emit(PostLoadSuccess(await _postRepository.fetch(sortType)));
  }
}
