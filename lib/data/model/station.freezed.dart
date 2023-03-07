// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Station {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  LatLng get latLng => throw _privateConstructorUsedError;
  String get province => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  Time get opensAt => throw _privateConstructorUsedError;
  Time get closesAt => throw _privateConstructorUsedError;
  StationStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StationCopyWith<Station> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationCopyWith<$Res> {
  factory $StationCopyWith(Station value, $Res Function(Station) then) =
      _$StationCopyWithImpl<$Res, Station>;
  @useResult
  $Res call(
      {int id,
      String name,
      LatLng latLng,
      String province,
      String city,
      String address,
      Time opensAt,
      Time closesAt,
      StationStatus status});

  $TimeCopyWith<$Res> get opensAt;
  $TimeCopyWith<$Res> get closesAt;
}

/// @nodoc
class _$StationCopyWithImpl<$Res, $Val extends Station>
    implements $StationCopyWith<$Res> {
  _$StationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latLng = null,
    Object? province = null,
    Object? city = null,
    Object? address = null,
    Object? opensAt = null,
    Object? closesAt = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      opensAt: null == opensAt
          ? _value.opensAt
          : opensAt // ignore: cast_nullable_to_non_nullable
              as Time,
      closesAt: null == closesAt
          ? _value.closesAt
          : closesAt // ignore: cast_nullable_to_non_nullable
              as Time,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StationStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeCopyWith<$Res> get opensAt {
    return $TimeCopyWith<$Res>(_value.opensAt, (value) {
      return _then(_value.copyWith(opensAt: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeCopyWith<$Res> get closesAt {
    return $TimeCopyWith<$Res>(_value.closesAt, (value) {
      return _then(_value.copyWith(closesAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StationCopyWith<$Res> implements $StationCopyWith<$Res> {
  factory _$$_StationCopyWith(
          _$_Station value, $Res Function(_$_Station) then) =
      __$$_StationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      LatLng latLng,
      String province,
      String city,
      String address,
      Time opensAt,
      Time closesAt,
      StationStatus status});

  @override
  $TimeCopyWith<$Res> get opensAt;
  @override
  $TimeCopyWith<$Res> get closesAt;
}

/// @nodoc
class __$$_StationCopyWithImpl<$Res>
    extends _$StationCopyWithImpl<$Res, _$_Station>
    implements _$$_StationCopyWith<$Res> {
  __$$_StationCopyWithImpl(_$_Station _value, $Res Function(_$_Station) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latLng = null,
    Object? province = null,
    Object? city = null,
    Object? address = null,
    Object? opensAt = null,
    Object? closesAt = null,
    Object? status = null,
  }) {
    return _then(_$_Station(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      opensAt: null == opensAt
          ? _value.opensAt
          : opensAt // ignore: cast_nullable_to_non_nullable
              as Time,
      closesAt: null == closesAt
          ? _value.closesAt
          : closesAt // ignore: cast_nullable_to_non_nullable
              as Time,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StationStatus,
    ));
  }
}

/// @nodoc

class _$_Station implements _Station {
  const _$_Station(
      {required this.id,
      required this.name,
      required this.latLng,
      required this.province,
      required this.city,
      required this.address,
      required this.opensAt,
      required this.closesAt,
      required this.status});

  @override
  final int id;
  @override
  final String name;
  @override
  final LatLng latLng;
  @override
  final String province;
  @override
  final String city;
  @override
  final String address;
  @override
  final Time opensAt;
  @override
  final Time closesAt;
  @override
  final StationStatus status;

  @override
  String toString() {
    return 'Station(id: $id, name: $name, latLng: $latLng, province: $province, city: $city, address: $address, opensAt: $opensAt, closesAt: $closesAt, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Station &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latLng, latLng) || other.latLng == latLng) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.opensAt, opensAt) || other.opensAt == opensAt) &&
            (identical(other.closesAt, closesAt) ||
                other.closesAt == closesAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, latLng, province, city,
      address, opensAt, closesAt, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StationCopyWith<_$_Station> get copyWith =>
      __$$_StationCopyWithImpl<_$_Station>(this, _$identity);
}

abstract class _Station implements Station {
  const factory _Station(
      {required final int id,
      required final String name,
      required final LatLng latLng,
      required final String province,
      required final String city,
      required final String address,
      required final Time opensAt,
      required final Time closesAt,
      required final StationStatus status}) = _$_Station;

  @override
  int get id;
  @override
  String get name;
  @override
  LatLng get latLng;
  @override
  String get province;
  @override
  String get city;
  @override
  String get address;
  @override
  Time get opensAt;
  @override
  Time get closesAt;
  @override
  StationStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_StationCopyWith<_$_Station> get copyWith =>
      throw _privateConstructorUsedError;
}
