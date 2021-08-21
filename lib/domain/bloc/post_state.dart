part of 'post_cubit.dart';

class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {
  PostInitial() : super();
}

class PostLoadInProgress extends PostState {
  PostLoadInProgress() : super();
}

class PostLoadSuccess extends PostState {
  final List<Post> posts;
  PostLoadSuccess(this.posts) : super();

  @override
  List<Object?> get props => [posts];
}
