import 'package:bloc_patter_course/features/post/domain/repository/post_repository.dart';

class CreatePostUsecase {
  final PostRepository repository;

  CreatePostUsecase({required this.repository});
  Future call(CreatePostParam params) {
    return repository.createPost(name: params.name, body: params.body);
  }
}

class CreatePostParam {
  final String name;
  final String body;

  CreatePostParam({required this.name, required this.body});
}
