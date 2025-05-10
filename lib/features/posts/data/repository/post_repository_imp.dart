import 'package:fpdart/fpdart.dart';
import 'package:bloc_patter_course/core/errors/failure.dart';
import 'package:bloc_patter_course/features/posts/data/datasource/post_remote_datasource.dart';
import 'package:bloc_patter_course/features/posts/data/models/post_model.dart';
import 'package:bloc_patter_course/features/posts/domain/entities/post_entity.dart';
import 'package:bloc_patter_course/features/posts/domain/repository/post_repository.dart';

class PostRepositoryImplementation implements PostRepository {
  PostRemoteDatasource postRemoteDatasource;
  PostRepositoryImplementation({required this.postRemoteDatasource});

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    try {
      final posts = await postRemoteDatasource.getPosts();

      final data = posts.map((post) => PostModel.fromMap(post)).toList();

      return Right(data);
    } on Failure catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(Failure());
    }
  }
}
