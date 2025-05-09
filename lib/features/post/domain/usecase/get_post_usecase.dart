import 'package:bloc_patter_course/core/errors/failure.dart';
import 'package:bloc_patter_course/features/post/domain/entities/post_entity.dart';
import 'package:bloc_patter_course/features/post/domain/repository/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetPostUsecase {
  final PostRepository repository;

  GetPostUsecase({required this.repository});
  Future<Either<PostEntity, Failure>> call() {
    return repository.getPosts();
  }
}
