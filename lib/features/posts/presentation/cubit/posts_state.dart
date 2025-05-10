import 'package:bloc_patter_course/features/posts/domain/entities/post_entity.dart';
//In Dart, a sealed class is a special type of class that restricts inheritance to only specific subclasses. The subclasses can only be defined within the same library or file where the sealed class itself is defined.

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

class PostError extends PostsState {
  PostError();
}
