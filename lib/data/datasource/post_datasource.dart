import 'package:flutter_base/data/model/post_model.dart';

abstract class PostDataSourceRemote {
  Future<List<PostModel>> getPosts();
}
