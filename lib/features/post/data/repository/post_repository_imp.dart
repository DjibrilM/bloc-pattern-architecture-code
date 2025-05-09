import 'package:fpdart/fpdart.dart';
import 'package:bloc_patter_course/core/errors/failure.dart';
import 'package:bloc_patter_course/features/post/data/datasource/post_remote_datasource.dart';
import 'package:bloc_patter_course/features/post/data/models/post_model.dart';
import 'package:bloc_patter_course/features/post/domain/entities/post_entity.dart';
import 'package:bloc_patter_course/features/post/domain/repository/post_repository.dart';
import 'package:bloc_patter_course/features/post/domain/usecase/create_post_usecase.dart';

class PostRepositoryImplementation implements PostRepository {
  @override
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

  @override
  Future createPost({required String title, required String body}) async {
    try {
      final post = await postRemoteDatasource
          .createPost(CreatePostParam(title: title, body: body));

      if (post == null) {
        return Left(Failure(message: "Unexpected error occurred"));
      }

      PostModel data = PostModel.fromMap(post);
      return Right(data);
    } on Failure catch (e) {
      return Right(Failure(message: e.message));
    } catch (e) {
      return Right(Failure());
    }
  }
}
