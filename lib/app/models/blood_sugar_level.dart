import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_sugar_level.freezed.dart';
part 'blood_sugar_level.g.dart';



@freezed
class BloodSugarLevel with _$BloodSugarLevel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    includeIfNull: false,
    explicitToJson: true,
  )
  const factory BloodSugarLevel({
    required double level,
    required DateTime timestamp,
  }) = _BloodSugarLevel;

  factory BloodSugarLevel.fromJson(Map<String, Object?> json) => _$BloodSugarLevelFromJson(json);
}
