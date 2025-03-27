import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app/consts.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
  await dotenv.load();
  getIt.init();
}

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(
        baseUrl: fakeStoreApiUrl ?? '',
      ));
}
