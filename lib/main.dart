import 'package:bloc_patter_course/features/post/presentation/screens/create_post.dart';
import 'package:bloc_patter_course/features/post/presentation/screens/posts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Posts(),
      routes: {
        CreatePost.routeName: (context) => CreatePost(),
      },
    );
  }
}
