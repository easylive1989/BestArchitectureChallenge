import 'package:best_architecture_challenge/data/remote/post_api.dart';
import 'package:best_architecture_challenge/data/repository/sorted_post_repository.dart';
import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:best_architecture_challenge/domain/entity/sort_type.dart';
import 'package:flutter/foundation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../fixture.dart';
import 'sorted_post_repository_test.mocks.dart';

@GenerateMocks([PostApi])
late MockPostApi mockPostApi;
late SortedPostRepository sortedPostRepository;

void main() {
  setUp(() {
    mockPostApi = MockPostApi();
    sortedPostRepository = SortedPostRepository(postApi: mockPostApi);
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
  when(mockPostApi.fetchPosts()).thenAnswer((_) {
    return Future.value(value);
  });
}

Future<void> sortedPostsShouldBe(SortType sortType, List<Post> expected) async {
  var posts = await sortedPostRepository.fetch(sortType);
  expect(listEquals(posts, expected), true);
}
