import 'package:bloc_patter_course/core/errors/failure.dart';
import 'package:bloc_patter_course/features/posts/domain/entities/post_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
}
