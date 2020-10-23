import 'package:flutter_base/data/model/post_model.dart';

abstract class PostsState {
  const PostsState();
}

class PostsInitialState extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsErrorState extends PostsState {
  final String message;

  PostsErrorState(this.message);
}

class PostsLoadedState extends PostsState {
  final List<PostModel> posts;

  PostsLoadedState(this.posts);
}
