import 'package:bloc_patter_course/core/errors/failure.dart';
import 'package:bloc_patter_course/core/network/dio_client.dart';
import 'package:bloc_patter_course/features/post/domain/usecase/create_post_usecase.dart';
import 'package:dio/dio.dart';

Dio http = DioClient.instance();

class PostRemoteDatasource {
  Future<List<dynamic>> getPosts() async {
    try {
      final Response<dynamic> response = await http.get("/posts");

      return response.data;
    } on DioException catch (e) {
      throw Failure(message: e.message as String);
    } catch (e) {
      throw Exception();
    }
  }

  Future createPost(CreatePostParam params) async {
    try {
      Response<dynamic> response = await http.post('/posts', data: {
        "title": params.title,
        "body": params.body,
      });

      return response;
    } on DioException catch (e) {
      Failure(message: e.message!);
    } catch (e) {
      Exception("Something went wrong");
    }
  }
}
