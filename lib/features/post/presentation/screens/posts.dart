import 'package:bloc_patter_course/features/post/presentation/cubit/posts_cubit.dart';
import 'package:bloc_patter_course/features/post/presentation/cubit/posts_state.dart';
import 'package:bloc_patter_course/features/post/presentation/screens/create_post.dart';
import 'package:bloc_patter_course/features/post/presentation/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  void initState() {
    context.read<PostsCubit>().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, CreatePost.routeName);
                  },
                )
              ],
              title: Text('Posts'),
            ),
            body: Builder(builder: (_) {
              if (state is PostsLoading) {
                return Center(
                    child: Container(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ));
              }

              if (state is LoadedPosts) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<PostsCubit>().getPosts();
                  },
                  child: ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (_, index) {
                        return Post(
                            key: Key(state.posts[index].id.toString()),
                            title: state.posts[index].title,
                            body: state.posts[index].body);
                      }),
                );
              }

              return Center(
                  child: Container(
                padding: EdgeInsets.all(20),
                child: const CircularProgressIndicator(),
              ));
            }));
      },
    );
  }
}
