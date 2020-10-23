import 'package:flutter/material.dart';
import 'package:flutter_base/presentation/posts/posts_cubit.dart';
import 'package:flutter_base/presentation/posts/posts_page.dart';
import 'package:flutter_base/presentation/posts/posts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/container_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<PostCubit>(),
      child: BlocBuilder<PostCubit, PostsState>(
        builder: (context, state) {
          return MaterialApp(
            home: PostsPage(),
          );
        },
      ),
    );
  }
}
