import 'package:bloc_patter_course/core/errors/failure.dart';
import 'package:bloc_patter_course/features/post/data/datasource/post_remote_datasource.dart';
import 'package:bloc_patter_course/features/post/domain/entities/post_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PostRepository {
  PostRemoteDatasource postRemoteDatasource;

  PostRepository({required this.postRemoteDatasource});

  Future<Either<Failure, List<PostEntity>>> getPosts();
  Future createPost({required String title, required String body});
}
