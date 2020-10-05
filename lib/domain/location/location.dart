import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';

part 'location.freezed.dart';

@immutable
@freezed
abstract class LocationDomain with _$LocationDomain {
  const factory LocationDomain({
    @required String fullAddress,
    @required String formattedAddress,
    @required GeoFirePoint geoFirePoint,
    @required Position position,
  }) = _LocationDomain;
}
