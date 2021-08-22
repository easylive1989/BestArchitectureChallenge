import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:best_architecture_challenge/domain/entity/sort_type.dart';
import 'package:best_architecture_challenge/domain/repository/post_repository.dart';
import 'package:best_architecture_challenge/domain/use_case/post_service.dart';
import 'package:flutter/foundation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixture.dart';
import 'post_service_test.mocks.dart';

@GenerateMocks([PostRepository])
late PostRepository mockPostRepository;
late PostService postService;

void main() {
  setUp(() {
    mockPostRepository = MockPostRepository();
    postService = PostService(postRepository: mockPostRepository);
  });

  test('sort empty list', () async {
    givenPosts([]);
    await sortedPostsShouldBe(SortType.ById, []);
  });

  test('sort post by id', () async {
    givenPosts([
      post(id: 3),
      post(id: 2),
      post(id: 1),
    ]);

    await sortedPostsShouldBe(SortType.ById, [
      post(id: 1),
      post(id: 2),
      post(id: 3),
    ]);
  });

  test('sort post by title', () async {
    givenPosts([
      post(id: 3, title: "first one"),
      post(id: 2, title: "apple"),
      post(id: 1, title: "zoo is good"),
    ]);

    await sortedPostsShouldBe(SortType.ByTitle, [
      post(id: 2, title: "apple"),
      post(id: 3, title: "first one"),
      post(id: 1, title: "zoo is good"),
    ]);
  });
}

void givenPosts(List<Post> value) {
  when(mockPostRepository.fetch()).thenAnswer((_) {
    return Future.value(value);
  });
}

Future<void> sortedPostsShouldBe(SortType sortType, List<Post> expected) async {
  var posts = await postService.fetch(sortType);
  expect(listEquals(posts, expected), true);
}
