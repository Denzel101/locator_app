import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locator_app/home/home.dart';
import 'package:locator_app/utils/utils.dart';

part 'fetch_location_cubit.freezed.dart';
part 'fetch_location_state.dart';

class FetchLocationCubit extends Cubit<FetchLocationState> {
  FetchLocationCubit({required LocationRepository locationRepository})
      : super(const FetchLocationState.initial()) {
    _locationRepository = locationRepository;
  }

  late LocationRepository _locationRepository;

  Future<void> fetchUserLocation() async {
    try {
      emit(const FetchLocationState.loading());
      final response = await _locationRepository.fetchUserItemsLocation();
      emit(FetchLocationState.loaded(response: response));
    } on Failure catch (e) {
      emit(FetchLocationState.error(error: e.message));
    } catch (e) {
      emit(FetchLocationState.error(error: e.toString()));
    }
  }
}
