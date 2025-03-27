import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:logging/logging.dart';

import 'injection.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async =>
    runZonedGuarded(() async => _initialize(builder), _handleError);

void _initialize(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await configureDependencies();
  _initLogger();
  return runApp(await builder());
}

void _initLogger() {
  Logger.root.level = kDebugMode ? Level.ALL : Level.INFO;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });
}

void _handleError(Object error, StackTrace stack) {
  final logger = Logger('_handleError');

  if (kDebugMode) {
    logger.warning('Error: $error; stack: $stack');
  }
}
