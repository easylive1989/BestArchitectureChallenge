part of 'post_cubit.dart';

class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoadInProgress extends PostState {}

class PostLoadSuccess extends PostState {
  final List<Post> posts;
  PostLoadSuccess(this.posts);

  @override
  List<Object?> get props => [posts];
}

class PostLoadFailure extends PostState {
  final SortType sortType;

  PostLoadFailure(this.sortType);

  @override
  List<Object?> get props => [sortType];
}
