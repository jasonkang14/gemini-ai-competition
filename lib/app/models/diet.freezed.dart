// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Diet _$DietFromJson(Map<String, dynamic> json) {
  return _Diet.fromJson(json);
}

/// @nodoc
mixin _$Diet {
  int get calories => throw _privateConstructorUsedError;
  int get protein => throw _privateConstructorUsedError;
  int get carbs => throw _privateConstructorUsedError;
  int get fat => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: true,
      fromJson: Diet.serializeTimestampToTime)
  String get datetime => throw _privateConstructorUsedError;
  List<String> get impactList => throw _privateConstructorUsedError;
  List<String> get menuList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DietCopyWith<Diet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietCopyWith<$Res> {
  factory $DietCopyWith(Diet value, $Res Function(Diet) then) =
      _$DietCopyWithImpl<$Res, Diet>;
  @useResult
  $Res call(
      {int calories,
      int protein,
      int carbs,
      int fat,
      String imagePath,
      @JsonKey(
          includeFromJson: true,
          includeToJson: true,
          fromJson: Diet.serializeTimestampToTime)
      String datetime,
      List<String> impactList,
      List<String> menuList});
}

/// @nodoc
class _$DietCopyWithImpl<$Res, $Val extends Diet>
    implements $DietCopyWith<$Res> {
  _$DietCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = null,
    Object? protein = null,
    Object? carbs = null,
    Object? fat = null,
    Object? imagePath = null,
    Object? datetime = null,
    Object? impactList = null,
    Object? menuList = null,
  }) {
    return _then(_value.copyWith(
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as int,
      carbs: null == carbs
          ? _value.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as int,
      fat: null == fat
          ? _value.fat
          : fat // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      impactList: null == impactList
          ? _value.impactList
          : impactList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      menuList: null == menuList
          ? _value.menuList
          : menuList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DietImplCopyWith<$Res> implements $DietCopyWith<$Res> {
  factory _$$DietImplCopyWith(
          _$DietImpl value, $Res Function(_$DietImpl) then) =
      __$$DietImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int calories,
      int protein,
      int carbs,
      int fat,
      String imagePath,
      @JsonKey(
          includeFromJson: true,
          includeToJson: true,
          fromJson: Diet.serializeTimestampToTime)
      String datetime,
      List<String> impactList,
      List<String> menuList});
}

/// @nodoc
class __$$DietImplCopyWithImpl<$Res>
    extends _$DietCopyWithImpl<$Res, _$DietImpl>
    implements _$$DietImplCopyWith<$Res> {
  __$$DietImplCopyWithImpl(_$DietImpl _value, $Res Function(_$DietImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = null,
    Object? protein = null,
    Object? carbs = null,
    Object? fat = null,
    Object? imagePath = null,
    Object? datetime = null,
    Object? impactList = null,
    Object? menuList = null,
  }) {
    return _then(_$DietImpl(
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as int,
      carbs: null == carbs
          ? _value.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as int,
      fat: null == fat
          ? _value.fat
          : fat // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
      impactList: null == impactList
          ? _value._impactList
          : impactList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      menuList: null == menuList
          ? _value._menuList
          : menuList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    fieldRename: FieldRename.snake, includeIfNull: false, explicitToJson: true)
class _$DietImpl implements _Diet {
  const _$DietImpl(
      {this.calories = 0,
      this.protein = 0,
      this.carbs = 0,
      this.fat = 0,
      this.imagePath = '',
      @JsonKey(
          includeFromJson: true,
          includeToJson: true,
          fromJson: Diet.serializeTimestampToTime)
      this.datetime = '',
      final List<String> impactList = const [],
      final List<String> menuList = const []})
      : _impactList = impactList,
        _menuList = menuList;

  factory _$DietImpl.fromJson(Map<String, dynamic> json) =>
      _$$DietImplFromJson(json);

  @override
  @JsonKey()
  final int calories;
  @override
  @JsonKey()
  final int protein;
  @override
  @JsonKey()
  final int carbs;
  @override
  @JsonKey()
  final int fat;
  @override
  @JsonKey()
  final String imagePath;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: true,
      fromJson: Diet.serializeTimestampToTime)
  final String datetime;
  final List<String> _impactList;
  @override
  @JsonKey()
  List<String> get impactList {
    if (_impactList is EqualUnmodifiableListView) return _impactList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_impactList);
  }

  final List<String> _menuList;
  @override
  @JsonKey()
  List<String> get menuList {
    if (_menuList is EqualUnmodifiableListView) return _menuList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuList);
  }

  @override
  String toString() {
    return 'Diet(calories: $calories, protein: $protein, carbs: $carbs, fat: $fat, imagePath: $imagePath, datetime: $datetime, impactList: $impactList, menuList: $menuList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DietImpl &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.carbs, carbs) || other.carbs == carbs) &&
            (identical(other.fat, fat) || other.fat == fat) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            const DeepCollectionEquality()
                .equals(other._impactList, _impactList) &&
            const DeepCollectionEquality().equals(other._menuList, _menuList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      calories,
      protein,
      carbs,
      fat,
      imagePath,
      datetime,
      const DeepCollectionEquality().hash(_impactList),
      const DeepCollectionEquality().hash(_menuList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DietImplCopyWith<_$DietImpl> get copyWith =>
      __$$DietImplCopyWithImpl<_$DietImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DietImplToJson(
      this,
    );
  }
}

abstract class _Diet implements Diet {
  const factory _Diet(
      {final int calories,
      final int protein,
      final int carbs,
      final int fat,
      final String imagePath,
      @JsonKey(
          includeFromJson: true,
          includeToJson: true,
          fromJson: Diet.serializeTimestampToTime)
      final String datetime,
      final List<String> impactList,
      final List<String> menuList}) = _$DietImpl;

  factory _Diet.fromJson(Map<String, dynamic> json) = _$DietImpl.fromJson;

  @override
  int get calories;
  @override
  int get protein;
  @override
  int get carbs;
  @override
  int get fat;
  @override
  String get imagePath;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: true,
      fromJson: Diet.serializeTimestampToTime)
  String get datetime;
  @override
  List<String> get impactList;
  @override
  List<String> get menuList;
  @override
  @JsonKey(ignore: true)
  _$$DietImplCopyWith<_$DietImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
