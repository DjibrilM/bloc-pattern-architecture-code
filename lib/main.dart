import 'package:bloc_patter_course/core/injections/service_locator.dart';
import 'package:bloc_patter_course/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:bloc_patter_course/features/posts/presentation/screens/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  ServiceLocator serviceLocator = ServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => slInstance<PostsCubit>(instanceName: "postsCubit"))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BloC pattern architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Posts(),
    );
  }
}
