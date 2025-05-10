import 'package:bloc_patter_course/features/posts/data/datasource/post_remote_datasource.dart';
import 'package:bloc_patter_course/features/posts/data/repository/post_repository_imp.dart';
import 'package:bloc_patter_course/features/posts/domain/repository/post_repository.dart';
import 'package:bloc_patter_course/features/posts/domain/usecase/get_post_usecase.dart';
import 'package:bloc_patter_course/features/posts/presentation/cubit/posts_cubit.dart';
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

    sl.registerSingleton<PostsCubit>(
        PostsCubit(
          getPostUsecase: sl(instanceName: "getPostUsecase"),
        ),
        instanceName: "postsCubit");
  }
}
