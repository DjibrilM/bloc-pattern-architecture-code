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
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/create-post');
            },
          )
        ],
        title: Text('Posts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Post(
              title: 'Post 1',
              body:
                  'eum non blanditiis soluta porro quibusdam voluptas\nvel voluptatem qui placeat dolores qui velit aut\nvel inventore aut cumque culpa explicabo aliquid at\nperspiciatis est et voluptatem dignissimos dolor itaque sit nam',
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
