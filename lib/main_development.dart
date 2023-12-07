import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locator_app/app/app.dart';
import 'package:locator_app/bootstrap.dart';
import 'package:locator_app/constants/constants.dart';
import 'package:locator_app/utils/utils.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    OnSpaceConfig(
      values: OnSpaceValues(
        urlScheme: 'https',
        baseDomain: 'jsonkeeper.com',
        hiveBoxKey: 'locator_app_dev',
      ),
    );

    setUpLocator();

    Bloc.observer = AppBlocObserver();

    runApp(
      MultiBlocProvider(
        providers: Singletons.registerCubits(),
        child: const App(),
      ),
    );
  }, (error, stackTrace) {
    if (kDebugMode) {
      log(error.toString(), stackTrace: stackTrace);
    }
  });
}
