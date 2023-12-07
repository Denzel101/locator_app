import 'package:get_it/get_it.dart';
import 'package:locator_app/home/home.dart';
import 'package:locator_app/utils/utils.dart';

final GetIt locator = GetIt.instance;

void setUpLocator() {
  locator
    ..registerSingleton<NetworkUtil>(
      NetworkUtil(),
    )
    ..registerSingleton<LocationRepository>(
      LocationRepository(
        networkUtil: locator<NetworkUtil>(),
      ),
    );
}
