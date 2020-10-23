import 'package:flutter_base/data/datasource/post_datasource.dart';
import 'package:flutter_base/data/impl/datasource/post_datasource_impl.dart';

import 'container_module.dart';

void getDataSource() {
  get.registerLazySingleton<PostDataSourceRemote>(
      () => PostDataSourceRemoteImpl(dio: get()));
}
