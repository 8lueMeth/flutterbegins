import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/data/model/post_model.dart';
import 'package:flutter_base/di/container_module.dart';
import 'package:flutter_base/presentation/posts/posts_cubit.dart';
import 'package:flutter_base/presentation/posts/posts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PostsPageState();
}

class PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  Widget body(context) {
    return BlocProvider(
      create: (context) => get<PostCubit>(),
      child: BlocConsumer<PostCubit, PostsState>(
        listener: (context, state) {
          if (state is PostsErrorState) {
            showSnackBar(context);
          }
        },
        builder: (context, state) {
          if (state is PostsInitialState) {
            getPosts(context);
            return postsPageInitial();
          } else if (state is PostsLoadingState) {
            return postsPageLoading();
          } else if (state is PostsLoadedState) {
            return postsList(state.posts);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget postsList(List<PostModel> posts) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(posts[index].title),
              subtitle: Text(posts[index].body),
              leading: Icon(Icons.message),
            ),
          );
        });
  }

  Widget postsPageLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget postsPageInitial() {
    return Center(
      child: Container(),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text("Posts"),
    );
  }

  showSnackBar(context) {
    final snackBar = SnackBar(
      duration: Duration(days: 365),
      content: Text('Error!'),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
        },
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  getPosts(context) {
    BlocProvider.of<PostCubit>(context).getPosts();
  }
}
