// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_sugar_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodSugarLevelImpl _$$BloodSugarLevelImplFromJson(
        Map<String, dynamic> json) =>
    _$BloodSugarLevelImpl(
      level: (json['level'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$BloodSugarLevelImplToJson(
        _$BloodSugarLevelImpl instance) =>
    <String, dynamic>{
      'level': instance.level,
      'timestamp': instance.timestamp.toIso8601String(),
    };
