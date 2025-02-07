import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/users/domain/usecases/get_posts.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPosts getPosts;
  PostsBloc({required this.getPosts}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      emit(PostsLoading());
      try {
        final post = await getPosts();
        emit(PostsLoaded(post));
      } catch (e) {
        emit(PostsFailed('Failed to load posts'));
      }
    });
  }
}
