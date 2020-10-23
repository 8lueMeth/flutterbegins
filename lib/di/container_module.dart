import 'package:flutter_base/di/datasource_module.dart';
import 'package:flutter_base/di/repository_module.dart';
import 'package:flutter_base/di/usecase_module.dart';
import 'package:get_it/get_it.dart';

import 'bloc_module.dart';
import 'external_module.dart';

final get = GetIt.instance;

Future<void> init() async {
  // bloc :
  getBloc();

  // use cases :
  getUseCase();

  // repository :
  getRepo();

  // data source
  getDataSource();

  // external :
  getExternal();
}
