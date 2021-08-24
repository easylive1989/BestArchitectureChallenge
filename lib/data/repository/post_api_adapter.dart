import "package:best_architecture_challenge/data/external/post_api.dart";
import "package:best_architecture_challenge/domain/entity/post.dart";
import "package:best_architecture_challenge/domain/exception/post_read_failed_exception.dart";
import "package:best_architecture_challenge/domain/repository/post_repository.dart";
import "package:injectable/injectable.dart";

@Singleton(as: PostRepository)
class PostApiAdapter implements PostRepository {
  final PostApi _postApi;

  PostApiAdapter({required PostApi postApi}) : _postApi = postApi;

  @override
  Future<List<Post>> fetch() async {
    try {
      var result = await _postApi.get();
      return result.map<Post>((result) => Post.fromJson(result)).toList();
    } catch (_) {
      throw PostReadFailedException();
    }
  }
}
