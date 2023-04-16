// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddModel _$$_AddModelFromJson(Map<String, dynamic> json) => _$_AddModel(
      from: json['from'] as String,
      to: json['to'] as String,
      price: json['price'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_AddModelToJson(_$_AddModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'price': instance.price,
      'date': instance.date.toIso8601String(),
    };
