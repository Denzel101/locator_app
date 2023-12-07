part of 'fetch_location_cubit.dart';

@freezed
class FetchLocationState with _$FetchLocationState {
  const factory FetchLocationState.initial() = _Initial;
  const factory FetchLocationState.loading() = _Loading;
  const factory FetchLocationState.loaded({
    required FetchLocationDto response,
  }) = _Loaded;

  const factory FetchLocationState.error({
    required String error,
  }) = _Error;
}
