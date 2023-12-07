import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locator_app/home/home.dart';
import 'package:locator_app/utils/utils.dart';

class Singletons {
  static List<BlocProvider> registerCubits() => [
        BlocProvider<FetchLocationCubit>(
          create: (context) => FetchLocationCubit(
            locationRepository: locator<LocationRepository>(),
          ),
        ),
      ];
}
