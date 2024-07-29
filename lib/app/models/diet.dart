import 'package:freezed_annotation/freezed_annotation.dart';

part 'diet.freezed.dart';
part 'diet.g.dart';

@freezed
class Diet with _$Diet {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    includeIfNull: false,
    explicitToJson: true,
  )
  const factory Diet({
    @Default(0) int calories,
    @Default(0) int protein,
    @Default(0) int carbs,
    @Default(0) int fat,
    @Default('') String imagePath,
    @JsonKey(
      includeFromJson: true,
      includeToJson: true,
      fromJson: Diet.serializeTimestampToTime,
      // toJson: Diet.serializeColorToString,
    )
    @Default('')
    String datetime,
    @Default([]) List<String> impactList,
    @Default([]) List<String> menuList,
  }) = _Diet;
  static String serializeTimestampToTime(dynamic timestamp) => timestamp.toString();

  factory Diet.fromJson(Map<String, Object?> json) => _$DietFromJson(json);
}
