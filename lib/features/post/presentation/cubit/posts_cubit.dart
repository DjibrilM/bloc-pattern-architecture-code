import 'package:bloc_patter_course/features/post/domain/usecase/create_post_usecase.dart';
import 'package:bloc_patter_course/features/post/domain/usecase/get_post_usecase.dart';
import 'package:bloc_patter_course/features/post/presentation/cubit/posts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<PostsState> {
  GetPostUsecase getPostUsecase;
  CreatePostUsecase createPostUsecase;

  PostsCubit({required this.getPostUsecase, required this.createPostUsecase})
      : super(PostInitialState());

  Future<void> getPosts() async {
    emit(PostsLoading());
    final posts = await getPostUsecase();

    posts.fold(
        (err) => emit(PostError()), (posts) => emit(LoadedPosts(posts: posts)));
  }
}
