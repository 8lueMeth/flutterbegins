import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/domain/post/entity/post_entity.dart';
import 'package:flutter_base/core/domain/post/repository/post_repository.dart';
import 'package:flutter_base/data/datasource/post_datasource.dart';
import 'package:flutter_base/utils/exception.dart';
import 'package:flutter_base/utils/failure.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSourceRemote postDataSourceRemote;

  PostRepositoryImpl(this.postDataSourceRemote);

  @override
  Future<Either<Failure, List<ResPost>>> getPosts() async {
    try {
      var response = await postDataSourceRemote.getPosts();
      return Right(response);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ParseException {
      return Left(ParseFailure());
    }
  }
}
