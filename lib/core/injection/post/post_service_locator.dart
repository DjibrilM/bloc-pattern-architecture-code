import 'package:bloc_patter_course/features/post/data/datasource/post_remote_datasource.dart';
import 'package:bloc_patter_course/features/post/data/repository/post_repository_imp.dart';
import 'package:bloc_patter_course/features/post/domain/repository/post_repository.dart';
import 'package:bloc_patter_course/features/post/domain/usecase/create_post_usecase.dart';
import 'package:bloc_patter_course/features/post/domain/usecase/get_post_usecase.dart';
import 'package:bloc_patter_course/features/post/presentation/cubit/posts_cubit.dart';
import 'package:get_it/get_it.dart';

class PostServiceLocator {
  final GetIt sl;
  PostServiceLocator(this.sl);

  void init() {
    sl.registerSingleton<PostRemoteDatasource>(PostRemoteDatasource(),
        instanceName: 'postRemoteDatasource');

    sl.registerSingleton<PostRepository>(
        PostRepositoryImplementation(
            postRemoteDatasource: sl(instanceName: "postRemoteDatasource")),
        instanceName: 'postRepositoryImplementation');

    sl.registerSingleton<GetPostUsecase>(
        GetPostUsecase(
            repository: sl(instanceName: "postRepositoryImplementation")),
        instanceName: "getPostUsecase");

    sl.registerSingleton<CreatePostUsecase>(
        CreatePostUsecase(
            repository: sl(instanceName: "postRepositoryImplementation")),
        instanceName: "createPostUsecase");

    sl.registerSingleton<PostsCubit>(
        PostsCubit(
            getPostUsecase: sl(instanceName: "getPostUsecase"),
            createPostUsecase: sl(instanceName: "createPostUsecase")),
        instanceName: "postsCubit");
  }
}
