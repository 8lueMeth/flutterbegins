import 'package:flutter_base/presentation/posts/posts_cubit.dart';

import 'container_module.dart';

void getBloc() {
  get.registerFactory(() => PostCubit(get()));
}
