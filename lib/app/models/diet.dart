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
    @Default([]) List<String> impactList,
    @Default([]) List<String> menuList,
  }) = _Diet;

  factory Diet.fromJson(Map<String, Object?> json) => _$DietFromJson(json);
}
