import 'package:bloc_patter_course/features/post/domain/entities/post_entity.dart';

sealed class PostsState {
  PostsState();
}

class PostInitialState extends PostsState {
  PostInitialState();
}

class PostsLoading extends PostsState {
  PostsLoading();
}

class LoadedPosts extends PostsState {
  List<PostEntity> posts;
  LoadedPosts({required this.posts});
}

class CreatingPost extends PostsState {
  CreatingPost();
}

class PostError extends PostsState {
  PostError();
}
