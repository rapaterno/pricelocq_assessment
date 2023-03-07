// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'station_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StationState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Station> get stations => throw _privateConstructorUsedError;
  List<Station> get filteredStations => throw _privateConstructorUsedError;
  Station? get selected => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StationStateCopyWith<StationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationStateCopyWith<$Res> {
  factory $StationStateCopyWith(
          StationState value, $Res Function(StationState) then) =
      _$StationStateCopyWithImpl<$Res, StationState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Station> stations,
      List<Station> filteredStations,
      Station? selected,
      Object? error});

  $StationCopyWith<$Res>? get selected;
}

/// @nodoc
class _$StationStateCopyWithImpl<$Res, $Val extends StationState>
    implements $StationStateCopyWith<$Res> {
  _$StationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? stations = null,
    Object? filteredStations = null,
    Object? selected = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      stations: null == stations
          ? _value.stations
          : stations // ignore: cast_nullable_to_non_nullable
              as List<Station>,
      filteredStations: null == filteredStations
          ? _value.filteredStations
          : filteredStations // ignore: cast_nullable_to_non_nullable
              as List<Station>,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Station?,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StationCopyWith<$Res>? get selected {
    if (_value.selected == null) {
      return null;
    }

    return $StationCopyWith<$Res>(_value.selected!, (value) {
      return _then(_value.copyWith(selected: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StationStateCopyWith<$Res>
    implements $StationStateCopyWith<$Res> {
  factory _$$_StationStateCopyWith(
          _$_StationState value, $Res Function(_$_StationState) then) =
      __$$_StationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Station> stations,
      List<Station> filteredStations,
      Station? selected,
      Object? error});

  @override
  $StationCopyWith<$Res>? get selected;
}

/// @nodoc
class __$$_StationStateCopyWithImpl<$Res>
    extends _$StationStateCopyWithImpl<$Res, _$_StationState>
    implements _$$_StationStateCopyWith<$Res> {
  __$$_StationStateCopyWithImpl(
      _$_StationState _value, $Res Function(_$_StationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? stations = null,
    Object? filteredStations = null,
    Object? selected = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_StationState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      stations: null == stations
          ? _value._stations
          : stations // ignore: cast_nullable_to_non_nullable
              as List<Station>,
      filteredStations: null == filteredStations
          ? _value._filteredStations
          : filteredStations // ignore: cast_nullable_to_non_nullable
              as List<Station>,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Station?,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_StationState with DiagnosticableTreeMixin implements _StationState {
  const _$_StationState(
      {this.isLoading = false,
      final List<Station> stations = const [],
      final List<Station> filteredStations = const [],
      this.selected,
      this.error})
      : _stations = stations,
        _filteredStations = filteredStations;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Station> _stations;
  @override
  @JsonKey()
  List<Station> get stations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stations);
  }

  final List<Station> _filteredStations;
  @override
  @JsonKey()
  List<Station> get filteredStations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredStations);
  }

  @override
  final Station? selected;
  @override
  final Object? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StationState(isLoading: $isLoading, stations: $stations, filteredStations: $filteredStations, selected: $selected, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StationState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('stations', stations))
      ..add(DiagnosticsProperty('filteredStations', filteredStations))
      ..add(DiagnosticsProperty('selected', selected))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StationState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._stations, _stations) &&
            const DeepCollectionEquality()
                .equals(other._filteredStations, _filteredStations) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_stations),
      const DeepCollectionEquality().hash(_filteredStations),
      selected,
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StationStateCopyWith<_$_StationState> get copyWith =>
      __$$_StationStateCopyWithImpl<_$_StationState>(this, _$identity);
}

abstract class _StationState implements StationState {
  const factory _StationState(
      {final bool isLoading,
      final List<Station> stations,
      final List<Station> filteredStations,
      final Station? selected,
      final Object? error}) = _$_StationState;

  @override
  bool get isLoading;
  @override
  List<Station> get stations;
  @override
  List<Station> get filteredStations;
  @override
  Station? get selected;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$_StationStateCopyWith<_$_StationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStations,
    required TResult Function(String query) filterStations,
    required TResult Function(Station station) selectStation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStations,
    TResult? Function(String query)? filterStations,
    TResult? Function(Station station)? selectStation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStations,
    TResult Function(String query)? filterStations,
    TResult Function(Station station)? selectStation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StationEventGetStations value) getStations,
    required TResult Function(StationEventFilterStations value) filterStations,
    required TResult Function(StationEventSelectStation value) selectStation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StationEventGetStations value)? getStations,
    TResult? Function(StationEventFilterStations value)? filterStations,
    TResult? Function(StationEventSelectStation value)? selectStation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StationEventGetStations value)? getStations,
    TResult Function(StationEventFilterStations value)? filterStations,
    TResult Function(StationEventSelectStation value)? selectStation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationEventCopyWith<$Res> {
  factory $StationEventCopyWith(
          StationEvent value, $Res Function(StationEvent) then) =
      _$StationEventCopyWithImpl<$Res, StationEvent>;
}

/// @nodoc
class _$StationEventCopyWithImpl<$Res, $Val extends StationEvent>
    implements $StationEventCopyWith<$Res> {
  _$StationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StationEventGetStationsCopyWith<$Res> {
  factory _$$StationEventGetStationsCopyWith(_$StationEventGetStations value,
          $Res Function(_$StationEventGetStations) then) =
      __$$StationEventGetStationsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StationEventGetStationsCopyWithImpl<$Res>
    extends _$StationEventCopyWithImpl<$Res, _$StationEventGetStations>
    implements _$$StationEventGetStationsCopyWith<$Res> {
  __$$StationEventGetStationsCopyWithImpl(_$StationEventGetStations _value,
      $Res Function(_$StationEventGetStations) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StationEventGetStations
    with DiagnosticableTreeMixin
    implements StationEventGetStations {
  const _$StationEventGetStations();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StationEvent.getStations()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'StationEvent.getStations'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationEventGetStations);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStations,
    required TResult Function(String query) filterStations,
    required TResult Function(Station station) selectStation,
  }) {
    return getStations();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStations,
    TResult? Function(String query)? filterStations,
    TResult? Function(Station station)? selectStation,
  }) {
    return getStations?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStations,
    TResult Function(String query)? filterStations,
    TResult Function(Station station)? selectStation,
    required TResult orElse(),
  }) {
    if (getStations != null) {
      return getStations();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StationEventGetStations value) getStations,
    required TResult Function(StationEventFilterStations value) filterStations,
    required TResult Function(StationEventSelectStation value) selectStation,
  }) {
    return getStations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StationEventGetStations value)? getStations,
    TResult? Function(StationEventFilterStations value)? filterStations,
    TResult? Function(StationEventSelectStation value)? selectStation,
  }) {
    return getStations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StationEventGetStations value)? getStations,
    TResult Function(StationEventFilterStations value)? filterStations,
    TResult Function(StationEventSelectStation value)? selectStation,
    required TResult orElse(),
  }) {
    if (getStations != null) {
      return getStations(this);
    }
    return orElse();
  }
}

abstract class StationEventGetStations implements StationEvent {
  const factory StationEventGetStations() = _$StationEventGetStations;
}

/// @nodoc
abstract class _$$StationEventFilterStationsCopyWith<$Res> {
  factory _$$StationEventFilterStationsCopyWith(
          _$StationEventFilterStations value,
          $Res Function(_$StationEventFilterStations) then) =
      __$$StationEventFilterStationsCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$StationEventFilterStationsCopyWithImpl<$Res>
    extends _$StationEventCopyWithImpl<$Res, _$StationEventFilterStations>
    implements _$$StationEventFilterStationsCopyWith<$Res> {
  __$$StationEventFilterStationsCopyWithImpl(
      _$StationEventFilterStations _value,
      $Res Function(_$StationEventFilterStations) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$StationEventFilterStations(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StationEventFilterStations
    with DiagnosticableTreeMixin
    implements StationEventFilterStations {
  const _$StationEventFilterStations(this.query);

  @override
  final String query;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StationEvent.filterStations(query: $query)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StationEvent.filterStations'))
      ..add(DiagnosticsProperty('query', query));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationEventFilterStations &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StationEventFilterStationsCopyWith<_$StationEventFilterStations>
      get copyWith => __$$StationEventFilterStationsCopyWithImpl<
          _$StationEventFilterStations>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStations,
    required TResult Function(String query) filterStations,
    required TResult Function(Station station) selectStation,
  }) {
    return filterStations(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStations,
    TResult? Function(String query)? filterStations,
    TResult? Function(Station station)? selectStation,
  }) {
    return filterStations?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStations,
    TResult Function(String query)? filterStations,
    TResult Function(Station station)? selectStation,
    required TResult orElse(),
  }) {
    if (filterStations != null) {
      return filterStations(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StationEventGetStations value) getStations,
    required TResult Function(StationEventFilterStations value) filterStations,
    required TResult Function(StationEventSelectStation value) selectStation,
  }) {
    return filterStations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StationEventGetStations value)? getStations,
    TResult? Function(StationEventFilterStations value)? filterStations,
    TResult? Function(StationEventSelectStation value)? selectStation,
  }) {
    return filterStations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StationEventGetStations value)? getStations,
    TResult Function(StationEventFilterStations value)? filterStations,
    TResult Function(StationEventSelectStation value)? selectStation,
    required TResult orElse(),
  }) {
    if (filterStations != null) {
      return filterStations(this);
    }
    return orElse();
  }
}

abstract class StationEventFilterStations implements StationEvent {
  const factory StationEventFilterStations(final String query) =
      _$StationEventFilterStations;

  String get query;
  @JsonKey(ignore: true)
  _$$StationEventFilterStationsCopyWith<_$StationEventFilterStations>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StationEventSelectStationCopyWith<$Res> {
  factory _$$StationEventSelectStationCopyWith(
          _$StationEventSelectStation value,
          $Res Function(_$StationEventSelectStation) then) =
      __$$StationEventSelectStationCopyWithImpl<$Res>;
  @useResult
  $Res call({Station station});

  $StationCopyWith<$Res> get station;
}

/// @nodoc
class __$$StationEventSelectStationCopyWithImpl<$Res>
    extends _$StationEventCopyWithImpl<$Res, _$StationEventSelectStation>
    implements _$$StationEventSelectStationCopyWith<$Res> {
  __$$StationEventSelectStationCopyWithImpl(_$StationEventSelectStation _value,
      $Res Function(_$StationEventSelectStation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? station = null,
  }) {
    return _then(_$StationEventSelectStation(
      null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as Station,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StationCopyWith<$Res> get station {
    return $StationCopyWith<$Res>(_value.station, (value) {
      return _then(_value.copyWith(station: value));
    });
  }
}

/// @nodoc

class _$StationEventSelectStation
    with DiagnosticableTreeMixin
    implements StationEventSelectStation {
  const _$StationEventSelectStation(this.station);

  @override
  final Station station;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StationEvent.selectStation(station: $station)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StationEvent.selectStation'))
      ..add(DiagnosticsProperty('station', station));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationEventSelectStation &&
            (identical(other.station, station) || other.station == station));
  }

  @override
  int get hashCode => Object.hash(runtimeType, station);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StationEventSelectStationCopyWith<_$StationEventSelectStation>
      get copyWith => __$$StationEventSelectStationCopyWithImpl<
          _$StationEventSelectStation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getStations,
    required TResult Function(String query) filterStations,
    required TResult Function(Station station) selectStation,
  }) {
    return selectStation(station);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getStations,
    TResult? Function(String query)? filterStations,
    TResult? Function(Station station)? selectStation,
  }) {
    return selectStation?.call(station);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getStations,
    TResult Function(String query)? filterStations,
    TResult Function(Station station)? selectStation,
    required TResult orElse(),
  }) {
    if (selectStation != null) {
      return selectStation(station);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StationEventGetStations value) getStations,
    required TResult Function(StationEventFilterStations value) filterStations,
    required TResult Function(StationEventSelectStation value) selectStation,
  }) {
    return selectStation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StationEventGetStations value)? getStations,
    TResult? Function(StationEventFilterStations value)? filterStations,
    TResult? Function(StationEventSelectStation value)? selectStation,
  }) {
    return selectStation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StationEventGetStations value)? getStations,
    TResult Function(StationEventFilterStations value)? filterStations,
    TResult Function(StationEventSelectStation value)? selectStation,
    required TResult orElse(),
  }) {
    if (selectStation != null) {
      return selectStation(this);
    }
    return orElse();
  }
}

abstract class StationEventSelectStation implements StationEvent {
  const factory StationEventSelectStation(final Station station) =
      _$StationEventSelectStation;

  Station get station;
  @JsonKey(ignore: true)
  _$$StationEventSelectStationCopyWith<_$StationEventSelectStation>
      get copyWith => throw _privateConstructorUsedError;
}
