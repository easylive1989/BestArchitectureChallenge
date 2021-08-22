import 'package:best_architecture_challenge/data/external/post_remote_api.dart';
import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:best_architecture_challenge/domain/repository/post_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PostRepository)
class PostRepositoryAdapter implements PostRepository {
  final PostRemoteApi _postRemoteApi;

  PostRepositoryAdapter({required PostRemoteApi postRemoteApi})
      : _postRemoteApi = postRemoteApi;

  @override
  Future<List<Post>> fetch() async {
    var result = await _postRemoteApi.get();
    return result.map<Post>((result) => Post.fromJson(result)).toList();
  }
}
