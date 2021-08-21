import 'package:best_architecture_challenge/data/remote/post_api.dart';
import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:best_architecture_challenge/domain/entity/sort_type.dart';
import 'package:best_architecture_challenge/domain/repository/post_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PostRepository)
class SortedPostRepository implements PostRepository {
  final PostApi _postApi;
  final Map<SortType, int Function(Post, Post)> sortRule = {
    SortType.ById: (post1, post2) => post1.id.compareTo(post2.id),
    SortType.ByTitle: (post1, post2) => post1.title.compareTo(post2.title),
  };

  SortedPostRepository({required PostApi postApi}) : this._postApi = postApi;

  Future<List<Post>> fetch(SortType sortType) async {
    return await _postApi.fetchPosts()
      ..sort(sortRule[sortType]);
  }
}
