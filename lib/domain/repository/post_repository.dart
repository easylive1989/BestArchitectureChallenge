import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:best_architecture_challenge/domain/entity/sort_type.dart';

abstract class PostRepository {
  Future<List<Post>> fetch(SortType sortType);
}
