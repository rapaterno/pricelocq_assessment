import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_assessment/data/model/time.dart';

part 'station.freezed.dart';

enum StationStatus { active, inactive }

@freezed
class Station with _$Station {
  const factory Station({
    required int id,
    required String name,
    required LatLng latLng,
    required String province,
    required String city,
    required String address,
    required Time opensAt,
    required Time closesAt,
    required StationStatus status,
  }) = _Station;

  factory Station.fromAPIJson(Map<String, dynamic> json) {
    final latitudeNum = json['latitude'];
    final longitudeNum = json['longitude'];
    final latitude = latitudeNum is int ? latitudeNum.toDouble() : latitudeNum;
    final longitude =
        longitudeNum is int ? longitudeNum.toDouble() : longitudeNum;
    final opensAt = Time.from24HrFormat(json['opensAt']);
    final closesAt = Time.from24HrFormat(json['closesAt']);
    final status = json['status'] == 'active'
        ? StationStatus.active
        : StationStatus.inactive;

    return Station(
      id: json['stationId'] as int,
      name: json['name'] as String,
      latLng: LatLng(latitude, longitude),
      province: json['province'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      opensAt: opensAt,
      closesAt: closesAt,
      status: status,
    );
  }
}
