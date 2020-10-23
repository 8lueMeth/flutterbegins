import 'package:flutter_base/core/domain/post/repository/post_repository.dart';
import 'package:flutter_base/data/impl/repository/post_repository_impl.dart';

import 'container_module.dart';

void getRepo() {
  get.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(get()));
}
