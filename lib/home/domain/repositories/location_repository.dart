import 'package:locator_app/constants/constants.dart';
import 'package:locator_app/home/home.dart';
import 'package:locator_app/utils/utils.dart';

class LocationRepository {
  LocationRepository({required NetworkUtil networkUtil})
      : _networkUtil = networkUtil;

  late final NetworkUtil _networkUtil;

  Future<FetchLocationDto> fetchUserItemsLocation() async {
    try {
      final response =
          await _networkUtil.getReq(Endpoints.fetchUserItemsLocation);
      return FetchLocationDto.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
