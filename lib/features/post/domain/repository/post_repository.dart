import 'package:bloc_patter_course/core/errors/failure.dart';
import 'package:bloc_patter_course/features/post/domain/entities/post_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PostRepository {
  Future<Either<PostEntity, Failure>> getPosts();
  Future createPost({required String name, required String body});
}
