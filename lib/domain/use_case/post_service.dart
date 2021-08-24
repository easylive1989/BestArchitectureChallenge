import "package:best_architecture_challenge/domain/entity/post.dart";
import "package:best_architecture_challenge/domain/entity/sort_type.dart";
import "package:best_architecture_challenge/domain/repository/post_repository.dart";
import "package:injectable/injectable.dart";

@injectable
class PostService {
  final PostRepository _postRepository;
  final Map<SortType, int Function(Post, Post)> sortRule = {
    SortType.byId: (Post post1, Post post2) => post1.id.compareTo(post2.id),
    SortType.byTitle: (Post post1, Post post2) =>
        post1.title.compareTo(post2.title),
  };

  PostService({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;

  Future<List<Post>> fetch(SortType sortType) async {
    return await _postRepository.fetch()
      ..sort(sortRule[sortType]);
  }
}
