import 'package:best_architecture_challenge/bloc/post_cubit.dart';
import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:best_architecture_challenge/domain/entity/sort_type.dart';
import 'package:best_architecture_challenge/domain/use_case/post_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixture.dart';
import 'post_cubit_test.mocks.dart';

late MockPostService mockPostService;

@GenerateMocks([PostService])
void main() {
  setUp(() {
    mockPostService = MockPostService();
  });

  blocTest<PostCubit, PostState>(
    'fetch empty post',
    build: () {
      givenPosts([]);
      return PostCubit(postService: mockPostService);
    },
    act: (bloc) => bloc.fetch(SortType.ByTitle),
    expect: () => [
      PostLoadInProgress(),
      PostLoadSuccess([]),
    ],
  );

  blocTest<PostCubit, PostState>(
    'fetch non empty post',
    build: () {
      givenPosts([
        post(id: 1),
        post(id: 2),
      ]);
      return PostCubit(postService: mockPostService);
    },
    act: (bloc) => bloc.fetch(SortType.ByTitle),
    expect: () => [
      PostLoadInProgress(),
      PostLoadSuccess([
        post(id: 1),
        post(id: 2),
      ]),
    ],
  );
}

void givenPosts(List<Post> value) {
  when(mockPostService.fetch(any)).thenAnswer((realInvocation) {
    return Future.value(value);
  });
}
