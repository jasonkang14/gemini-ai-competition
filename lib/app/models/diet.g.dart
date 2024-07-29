// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DietImpl _$$DietImplFromJson(Map<String, dynamic> json) => _$DietImpl(
      calories: (json['calories'] as num?)?.toInt() ?? 0,
      protein: (json['protein'] as num?)?.toInt() ?? 0,
      carbs: (json['carbs'] as num?)?.toInt() ?? 0,
      fat: (json['fat'] as num?)?.toInt() ?? 0,
      imagePath: json['image_path'] as String? ?? '',
      datetime: json['datetime'] == null
          ? ''
          : Diet.serializeTimestampToTime(json['datetime']),
      impactList: (json['impact_list'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      menuList: (json['menu_list'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DietImplToJson(_$DietImpl instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'protein': instance.protein,
      'carbs': instance.carbs,
      'fat': instance.fat,
      'image_path': instance.imagePath,
      'datetime': instance.datetime,
      'impact_list': instance.impactList,
      'menu_list': instance.menuList,
    };
