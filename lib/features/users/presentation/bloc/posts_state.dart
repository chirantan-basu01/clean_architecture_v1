part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Posts> post;

  PostsLoaded(this.post);

  @override
  List<Object> get props => [post];
}

class PostsFailed extends PostsState {
  final String message;

  PostsFailed(this.message);

  @override
  List<Object> get props => [message];
}
