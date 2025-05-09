import 'package:bloc_patter_course/features/post/domain/repository/post_repository.dart';

class CreatePostUsecase {
  final PostRepository repository;

  CreatePostUsecase({required this.repository});
  Future call(CreatePostParam params) {
    return repository.createPost(title: params.title, body: params.body);
  }
}

class CreatePostParam {
  final String title;
  final String body;

  CreatePostParam({required this.title, required this.body});
}
