import "package:best_architecture_challenge/bloc/post/post_cubit.dart";
import "package:best_architecture_challenge/domain/entity/post.dart";
import "package:best_architecture_challenge/domain/entity/sort_type.dart";
import "package:best_architecture_challenge/domain/exception/post_read_failed_exception.dart";
import "package:best_architecture_challenge/domain/use_case/post_service.dart";
import "package:bloc_test/bloc_test.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "../fixture.dart";
import "post_cubit_test.mocks.dart";

late MockPostService mockPostService;

@GenerateMocks([PostService])
void main() {
  setUp(() {
    mockPostService = MockPostService();
  });

  blocTest<PostCubit, PostState>(
    "fetch empty post",
    build: () {
      givenPosts([]);
      return getPostCubit();
    },
    act: (bloc) => bloc.fetch(SortType.byTitle),
    expect: () => [
      PostLoadInProgress(),
      PostLoadSuccess(List.empty()),
    ],
  );

  blocTest<PostCubit, PostState>(
    "fetch non empty post",
    build: () {
      givenPosts([
        post(id: 1),
        post(id: 2),
      ]);
      return getPostCubit();
    },
    act: (bloc) => bloc.fetch(SortType.byTitle),
    expect: () => [
      PostLoadInProgress(),
      PostLoadSuccess([
        post(id: 1),
        post(id: 2),
      ]),
    ],
  );

  blocTest<PostCubit, PostState>(
    "fetch post fail",
    build: () {
      givenPostReadFailed();
      return getPostCubit();
    },
    act: (bloc) => bloc.fetch(SortType.byTitle),
    expect: () => [
      PostLoadInProgress(),
      PostLoadFailure(SortType.byTitle),
    ],
  );

  blocTest<PostCubit, PostState>(
    "should not reload if not fail before",
    build: () {
      return getPostCubit();
    },
    act: (bloc) => bloc.reload(),
    expect: () => [],
  );

  blocTest<PostCubit, PostState>(
    "should reload if fail before",
    build: () {
      givenPosts([]);
      var postCubit = getPostCubit();
      postCubit.emit(PostLoadFailure(SortType.byId));
      return postCubit;
    },
    act: (bloc) => bloc.reload(),
    expect: () => [
      PostLoadInProgress(),
      PostLoadSuccess(List.empty()),
    ],
  );
}

PostCubit getPostCubit() => PostCubit(postService: mockPostService);

void givenPostReadFailed() {
  when(mockPostService.fetch(any)).thenThrow(PostReadFailedException());
}

void givenPosts(List<Post> value) {
  when(mockPostService.fetch(any)).thenAnswer((realInvocation) {
    return Future.value(value);
  });
}
