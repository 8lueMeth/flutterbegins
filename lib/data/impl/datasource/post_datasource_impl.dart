import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/data/datasource/post_datasource.dart';
import 'package:flutter_base/data/model/post_model.dart';
import 'package:flutter_base/utils/exception.dart';

class PostDataSourceRemoteImpl implements PostDataSourceRemote {
  final Dio dio;

  PostDataSourceRemoteImpl({@required this.dio});

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      var response =
          await dio.get("https://jsonplaceholder.typicode.com/posts");
      try {
        List<PostModel> posts = [];
        response.data.forEach((item) {
          posts.add(PostModel.fromJson(item));
        });
        return Future.value(posts);
      } catch (e) {
        throw ParseException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }
}
