import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_location_dto.freezed.dart';
part 'fetch_location_dto.g.dart';

@freezed
class FetchLocationDto with _$FetchLocationDto {
  factory FetchLocationDto({
    required String success,
    required String message,
    required int status,
    required FetchLocationData data,
  }) = _FetchLocationDto;

  factory FetchLocationDto.fromJson(Map<String, dynamic> json) =>
      _$FetchLocationDtoFromJson(json);
}

@freezed
class FetchLocationData with _$FetchLocationData {
  factory FetchLocationData({
    @JsonKey(name: 'user_id') required int userId,
    required List<FetchLocationItem> items,
  }) = _FetchLocationData;

  factory FetchLocationData.fromJson(Map<String, dynamic> json) =>
      _$FetchLocationDataFromJson(json);
}

@freezed
class FetchLocationItem with _$FetchLocationItem {
  factory FetchLocationItem({
    @JsonKey(name: 'item_id') required int itemId,
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'current_location') required Location currentLocation,
    @JsonKey(name: 'location_history') required List<Location> locationHistory,
  }) = _FetchLocationItem;

  factory FetchLocationItem.fromJson(Map<String, dynamic> json) =>
      _$FetchLocationItemFromJson(json);
}

@freezed
class Location with _$Location {
  factory Location({
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'street_name') required String streetName,
    required double latitude,
    required double longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
