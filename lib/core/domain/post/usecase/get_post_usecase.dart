import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/core/domain/post/entity/post_entity.dart';
import 'package:flutter_base/core/domain/post/repository/post_repository.dart';
import 'package:flutter_base/utils/failure.dart';

class GetPostUseCase {
  final PostRepository postRepository;

  GetPostUseCase({@required this.postRepository});

  Future<Either<Failure, List<ResPost>>> call() async {
    return await postRepository.getPosts();
  }
}
