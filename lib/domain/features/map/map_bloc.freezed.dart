// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'map_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LatLng latLng) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LatLng latLng)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LatLng latLng)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapStateIdle value) initial,
    required TResult Function(MapStateLoaded value) loaded,
    required TResult Function(MapStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapStateIdle value)? initial,
    TResult? Function(MapStateLoaded value)? loaded,
    TResult? Function(MapStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapStateIdle value)? initial,
    TResult Function(MapStateLoaded value)? loaded,
    TResult Function(MapStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MapStateIdleCopyWith<$Res> {
  factory _$$MapStateIdleCopyWith(
          _$MapStateIdle value, $Res Function(_$MapStateIdle) then) =
      __$$MapStateIdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MapStateIdleCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateIdle>
    implements _$$MapStateIdleCopyWith<$Res> {
  __$$MapStateIdleCopyWithImpl(
      _$MapStateIdle _value, $Res Function(_$MapStateIdle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MapStateIdle implements MapStateIdle {
  const _$MapStateIdle();

  @override
  String toString() {
    return 'MapState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MapStateIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LatLng latLng) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LatLng latLng)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LatLng latLng)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapStateIdle value) initial,
    required TResult Function(MapStateLoaded value) loaded,
    required TResult Function(MapStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapStateIdle value)? initial,
    TResult? Function(MapStateLoaded value)? loaded,
    TResult? Function(MapStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapStateIdle value)? initial,
    TResult Function(MapStateLoaded value)? loaded,
    TResult Function(MapStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MapStateIdle implements MapState {
  const factory MapStateIdle() = _$MapStateIdle;
}

/// @nodoc
abstract class _$$MapStateLoadedCopyWith<$Res> {
  factory _$$MapStateLoadedCopyWith(
          _$MapStateLoaded value, $Res Function(_$MapStateLoaded) then) =
      __$$MapStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({LatLng latLng});
}

/// @nodoc
class __$$MapStateLoadedCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateLoaded>
    implements _$$MapStateLoadedCopyWith<$Res> {
  __$$MapStateLoadedCopyWithImpl(
      _$MapStateLoaded _value, $Res Function(_$MapStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latLng = null,
  }) {
    return _then(_$MapStateLoaded(
      null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$MapStateLoaded implements MapStateLoaded {
  const _$MapStateLoaded(this.latLng);

  @override
  final LatLng latLng;

  @override
  String toString() {
    return 'MapState.loaded(latLng: $latLng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateLoaded &&
            (identical(other.latLng, latLng) || other.latLng == latLng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latLng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateLoadedCopyWith<_$MapStateLoaded> get copyWith =>
      __$$MapStateLoadedCopyWithImpl<_$MapStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LatLng latLng) loaded,
    required TResult Function() error,
  }) {
    return loaded(latLng);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LatLng latLng)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(latLng);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LatLng latLng)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(latLng);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapStateIdle value) initial,
    required TResult Function(MapStateLoaded value) loaded,
    required TResult Function(MapStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapStateIdle value)? initial,
    TResult? Function(MapStateLoaded value)? loaded,
    TResult? Function(MapStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapStateIdle value)? initial,
    TResult Function(MapStateLoaded value)? loaded,
    TResult Function(MapStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MapStateLoaded implements MapState {
  const factory MapStateLoaded(final LatLng latLng) = _$MapStateLoaded;

  LatLng get latLng;
  @JsonKey(ignore: true)
  _$$MapStateLoadedCopyWith<_$MapStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MapStateErrorCopyWith<$Res> {
  factory _$$MapStateErrorCopyWith(
          _$MapStateError value, $Res Function(_$MapStateError) then) =
      __$$MapStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MapStateErrorCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateError>
    implements _$$MapStateErrorCopyWith<$Res> {
  __$$MapStateErrorCopyWithImpl(
      _$MapStateError _value, $Res Function(_$MapStateError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MapStateError implements MapStateError {
  const _$MapStateError();

  @override
  String toString() {
    return 'MapState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MapStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(LatLng latLng) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(LatLng latLng)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(LatLng latLng)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapStateIdle value) initial,
    required TResult Function(MapStateLoaded value) loaded,
    required TResult Function(MapStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapStateIdle value)? initial,
    TResult? Function(MapStateLoaded value)? loaded,
    TResult? Function(MapStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapStateIdle value)? initial,
    TResult Function(MapStateLoaded value)? loaded,
    TResult Function(MapStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MapStateError implements MapState {
  const factory MapStateError() = _$MapStateError;
}

/// @nodoc
mixin _$MapEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startLocationStream,
    required TResult Function(LatLng latLng) updateLocation,
    required TResult Function() stopLocationStream,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startLocationStream,
    TResult? Function(LatLng latLng)? updateLocation,
    TResult? Function()? stopLocationStream,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startLocationStream,
    TResult Function(LatLng latLng)? updateLocation,
    TResult Function()? stopLocationStream,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapEventStartLocationStream value)
        startLocationStream,
    required TResult Function(MapEventUpdateLocation value) updateLocation,
    required TResult Function(MapEventStopLocationStream value)
        stopLocationStream,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapEventStartLocationStream value)? startLocationStream,
    TResult? Function(MapEventUpdateLocation value)? updateLocation,
    TResult? Function(MapEventStopLocationStream value)? stopLocationStream,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapEventStartLocationStream value)? startLocationStream,
    TResult Function(MapEventUpdateLocation value)? updateLocation,
    TResult Function(MapEventStopLocationStream value)? stopLocationStream,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapEventCopyWith<$Res> {
  factory $MapEventCopyWith(MapEvent value, $Res Function(MapEvent) then) =
      _$MapEventCopyWithImpl<$Res, MapEvent>;
}

/// @nodoc
class _$MapEventCopyWithImpl<$Res, $Val extends MapEvent>
    implements $MapEventCopyWith<$Res> {
  _$MapEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MapEventStartLocationStreamCopyWith<$Res> {
  factory _$$MapEventStartLocationStreamCopyWith(
          _$MapEventStartLocationStream value,
          $Res Function(_$MapEventStartLocationStream) then) =
      __$$MapEventStartLocationStreamCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MapEventStartLocationStreamCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$MapEventStartLocationStream>
    implements _$$MapEventStartLocationStreamCopyWith<$Res> {
  __$$MapEventStartLocationStreamCopyWithImpl(
      _$MapEventStartLocationStream _value,
      $Res Function(_$MapEventStartLocationStream) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MapEventStartLocationStream implements MapEventStartLocationStream {
  const _$MapEventStartLocationStream();

  @override
  String toString() {
    return 'MapEvent.startLocationStream()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapEventStartLocationStream);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startLocationStream,
    required TResult Function(LatLng latLng) updateLocation,
    required TResult Function() stopLocationStream,
  }) {
    return startLocationStream();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startLocationStream,
    TResult? Function(LatLng latLng)? updateLocation,
    TResult? Function()? stopLocationStream,
  }) {
    return startLocationStream?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startLocationStream,
    TResult Function(LatLng latLng)? updateLocation,
    TResult Function()? stopLocationStream,
    required TResult orElse(),
  }) {
    if (startLocationStream != null) {
      return startLocationStream();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapEventStartLocationStream value)
        startLocationStream,
    required TResult Function(MapEventUpdateLocation value) updateLocation,
    required TResult Function(MapEventStopLocationStream value)
        stopLocationStream,
  }) {
    return startLocationStream(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapEventStartLocationStream value)? startLocationStream,
    TResult? Function(MapEventUpdateLocation value)? updateLocation,
    TResult? Function(MapEventStopLocationStream value)? stopLocationStream,
  }) {
    return startLocationStream?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapEventStartLocationStream value)? startLocationStream,
    TResult Function(MapEventUpdateLocation value)? updateLocation,
    TResult Function(MapEventStopLocationStream value)? stopLocationStream,
    required TResult orElse(),
  }) {
    if (startLocationStream != null) {
      return startLocationStream(this);
    }
    return orElse();
  }
}

abstract class MapEventStartLocationStream implements MapEvent {
  const factory MapEventStartLocationStream() = _$MapEventStartLocationStream;
}

/// @nodoc
abstract class _$$MapEventUpdateLocationCopyWith<$Res> {
  factory _$$MapEventUpdateLocationCopyWith(_$MapEventUpdateLocation value,
          $Res Function(_$MapEventUpdateLocation) then) =
      __$$MapEventUpdateLocationCopyWithImpl<$Res>;
  @useResult
  $Res call({LatLng latLng});
}

/// @nodoc
class __$$MapEventUpdateLocationCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$MapEventUpdateLocation>
    implements _$$MapEventUpdateLocationCopyWith<$Res> {
  __$$MapEventUpdateLocationCopyWithImpl(_$MapEventUpdateLocation _value,
      $Res Function(_$MapEventUpdateLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latLng = null,
  }) {
    return _then(_$MapEventUpdateLocation(
      null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$MapEventUpdateLocation implements MapEventUpdateLocation {
  const _$MapEventUpdateLocation(this.latLng);

  @override
  final LatLng latLng;

  @override
  String toString() {
    return 'MapEvent.updateLocation(latLng: $latLng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapEventUpdateLocation &&
            (identical(other.latLng, latLng) || other.latLng == latLng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latLng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapEventUpdateLocationCopyWith<_$MapEventUpdateLocation> get copyWith =>
      __$$MapEventUpdateLocationCopyWithImpl<_$MapEventUpdateLocation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startLocationStream,
    required TResult Function(LatLng latLng) updateLocation,
    required TResult Function() stopLocationStream,
  }) {
    return updateLocation(latLng);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startLocationStream,
    TResult? Function(LatLng latLng)? updateLocation,
    TResult? Function()? stopLocationStream,
  }) {
    return updateLocation?.call(latLng);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startLocationStream,
    TResult Function(LatLng latLng)? updateLocation,
    TResult Function()? stopLocationStream,
    required TResult orElse(),
  }) {
    if (updateLocation != null) {
      return updateLocation(latLng);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapEventStartLocationStream value)
        startLocationStream,
    required TResult Function(MapEventUpdateLocation value) updateLocation,
    required TResult Function(MapEventStopLocationStream value)
        stopLocationStream,
  }) {
    return updateLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapEventStartLocationStream value)? startLocationStream,
    TResult? Function(MapEventUpdateLocation value)? updateLocation,
    TResult? Function(MapEventStopLocationStream value)? stopLocationStream,
  }) {
    return updateLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapEventStartLocationStream value)? startLocationStream,
    TResult Function(MapEventUpdateLocation value)? updateLocation,
    TResult Function(MapEventStopLocationStream value)? stopLocationStream,
    required TResult orElse(),
  }) {
    if (updateLocation != null) {
      return updateLocation(this);
    }
    return orElse();
  }
}

abstract class MapEventUpdateLocation implements MapEvent {
  const factory MapEventUpdateLocation(final LatLng latLng) =
      _$MapEventUpdateLocation;

  LatLng get latLng;
  @JsonKey(ignore: true)
  _$$MapEventUpdateLocationCopyWith<_$MapEventUpdateLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MapEventStopLocationStreamCopyWith<$Res> {
  factory _$$MapEventStopLocationStreamCopyWith(
          _$MapEventStopLocationStream value,
          $Res Function(_$MapEventStopLocationStream) then) =
      __$$MapEventStopLocationStreamCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MapEventStopLocationStreamCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$MapEventStopLocationStream>
    implements _$$MapEventStopLocationStreamCopyWith<$Res> {
  __$$MapEventStopLocationStreamCopyWithImpl(
      _$MapEventStopLocationStream _value,
      $Res Function(_$MapEventStopLocationStream) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MapEventStopLocationStream implements MapEventStopLocationStream {
  const _$MapEventStopLocationStream();

  @override
  String toString() {
    return 'MapEvent.stopLocationStream()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapEventStopLocationStream);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startLocationStream,
    required TResult Function(LatLng latLng) updateLocation,
    required TResult Function() stopLocationStream,
  }) {
    return stopLocationStream();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startLocationStream,
    TResult? Function(LatLng latLng)? updateLocation,
    TResult? Function()? stopLocationStream,
  }) {
    return stopLocationStream?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startLocationStream,
    TResult Function(LatLng latLng)? updateLocation,
    TResult Function()? stopLocationStream,
    required TResult orElse(),
  }) {
    if (stopLocationStream != null) {
      return stopLocationStream();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapEventStartLocationStream value)
        startLocationStream,
    required TResult Function(MapEventUpdateLocation value) updateLocation,
    required TResult Function(MapEventStopLocationStream value)
        stopLocationStream,
  }) {
    return stopLocationStream(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapEventStartLocationStream value)? startLocationStream,
    TResult? Function(MapEventUpdateLocation value)? updateLocation,
    TResult? Function(MapEventStopLocationStream value)? stopLocationStream,
  }) {
    return stopLocationStream?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapEventStartLocationStream value)? startLocationStream,
    TResult Function(MapEventUpdateLocation value)? updateLocation,
    TResult Function(MapEventStopLocationStream value)? stopLocationStream,
    required TResult orElse(),
  }) {
    if (stopLocationStream != null) {
      return stopLocationStream(this);
    }
    return orElse();
  }
}

abstract class MapEventStopLocationStream implements MapEvent {
  const factory MapEventStopLocationStream() = _$MapEventStopLocationStream;
}
