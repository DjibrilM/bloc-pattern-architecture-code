import 'package:bloc_patter_course/features/post/presentation/widgets/post.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Post(
              title: 'Post 1',
              body: 'This is the body of post 1',
            ),
            Post(
              title: 'Post 2',
              body: 'This is the body of post 2',
            ),
            Post(
              title: 'Post 3',
              body: 'This is the body of post 3',
            ),
          ],
        ),
      ),
    );
  }
}
