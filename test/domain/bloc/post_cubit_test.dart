import 'package:best_architecture_challenge/domain/bloc/post_cubit.dart';
import 'package:best_architecture_challenge/domain/entity/post.dart';
import 'package:best_architecture_challenge/domain/entity/sort_type.dart';
import 'package:best_architecture_challenge/domain/repository/post_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixture.dart';
import 'post_cubit_test.mocks.dart';

late MockPostRepository mockPostRepository;

@GenerateMocks([PostRepository])
void main() {
  setUp(() {
    mockPostRepository = MockPostRepository();
  });

  blocTest<PostCubit, PostState>(
    'fetch empty post',
    build: () {
      givenPosts([]);
      return PostCubit(postRepository: mockPostRepository);
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
      return PostCubit(postRepository: mockPostRepository);
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
  when(mockPostRepository.fetch(any)).thenAnswer((realInvocation) {
    return Future.value(value);
  });
}
