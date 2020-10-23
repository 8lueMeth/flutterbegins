import 'package:flutter_base/core/domain/post/usecase/get_post_usecase.dart';

import 'container_module.dart';

void getUseCase() {
  get.registerLazySingleton(() => GetPostUseCase(postRepository: get()));
}
