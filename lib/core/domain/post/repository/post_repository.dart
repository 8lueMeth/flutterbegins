import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/domain/post/entity/post_entity.dart';
import 'package:flutter_base/utils/failure.dart';

abstract class PostRepository {
  Future<Either<Failure, List<ResPost>>> getPosts();
}
