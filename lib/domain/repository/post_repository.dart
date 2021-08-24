import "package:best_architecture_challenge/domain/entity/post.dart";

abstract class PostRepository {
  Future<List<Post>> fetch();
}
