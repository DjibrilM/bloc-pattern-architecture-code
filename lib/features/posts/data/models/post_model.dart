import 'dart:convert';
import 'package:bloc_patter_course/features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({required super.title, required super.body, required super.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'id': id,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      title: map['title'] as String,
      body: map['body'] as String,
      id: map['id'] is int ? map['id'] : int.parse(map['id'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
