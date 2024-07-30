// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_sugar_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BloodSugarLevel _$BloodSugarLevelFromJson(Map<String, dynamic> json) {
  return _BloodSugarLevel.fromJson(json);
}

/// @nodoc
mixin _$BloodSugarLevel {
  double get level => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BloodSugarLevelCopyWith<BloodSugarLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodSugarLevelCopyWith<$Res> {
  factory $BloodSugarLevelCopyWith(
          BloodSugarLevel value, $Res Function(BloodSugarLevel) then) =
      _$BloodSugarLevelCopyWithImpl<$Res, BloodSugarLevel>;
  @useResult
  $Res call({double level, DateTime timestamp});
}

/// @nodoc
class _$BloodSugarLevelCopyWithImpl<$Res, $Val extends BloodSugarLevel>
    implements $BloodSugarLevelCopyWith<$Res> {
  _$BloodSugarLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodSugarLevelImplCopyWith<$Res>
    implements $BloodSugarLevelCopyWith<$Res> {
  factory _$$BloodSugarLevelImplCopyWith(_$BloodSugarLevelImpl value,
          $Res Function(_$BloodSugarLevelImpl) then) =
      __$$BloodSugarLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double level, DateTime timestamp});
}

/// @nodoc
class __$$BloodSugarLevelImplCopyWithImpl<$Res>
    extends _$BloodSugarLevelCopyWithImpl<$Res, _$BloodSugarLevelImpl>
    implements _$$BloodSugarLevelImplCopyWith<$Res> {
  __$$BloodSugarLevelImplCopyWithImpl(
      _$BloodSugarLevelImpl _value, $Res Function(_$BloodSugarLevelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? timestamp = null,
  }) {
    return _then(_$BloodSugarLevelImpl(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    fieldRename: FieldRename.snake, includeIfNull: false, explicitToJson: true)
class _$BloodSugarLevelImpl implements _BloodSugarLevel {
  const _$BloodSugarLevelImpl({required this.level, required this.timestamp});

  factory _$BloodSugarLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodSugarLevelImplFromJson(json);

  @override
  final double level;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'BloodSugarLevel(level: $level, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodSugarLevelImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, level, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodSugarLevelImplCopyWith<_$BloodSugarLevelImpl> get copyWith =>
      __$$BloodSugarLevelImplCopyWithImpl<_$BloodSugarLevelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodSugarLevelImplToJson(
      this,
    );
  }
}

abstract class _BloodSugarLevel implements BloodSugarLevel {
  const factory _BloodSugarLevel(
      {required final double level,
      required final DateTime timestamp}) = _$BloodSugarLevelImpl;

  factory _BloodSugarLevel.fromJson(Map<String, dynamic> json) =
      _$BloodSugarLevelImpl.fromJson;

  @override
  double get level;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$BloodSugarLevelImplCopyWith<_$BloodSugarLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
