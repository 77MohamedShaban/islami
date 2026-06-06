// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadioModel _$RadioModelFromJson(Map<String, dynamic> json) => RadioModel(
  radios: (json['radios'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Radios.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$RadioModelToJson(RadioModel instance) =>
    <String, dynamic>{'radios': instance.radios};

Radios _$RadiosFromJson(Map<String, dynamic> json) => Radios(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  url: json['url'] as String?,
  recentDate: json['recent_date'] as String?,
);

Map<String, dynamic> _$RadiosToJson(Radios instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'url': instance.url,
  'recent_date': instance.recentDate,
};
