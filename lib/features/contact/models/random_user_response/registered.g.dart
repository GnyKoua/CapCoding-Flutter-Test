// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registered.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Registered _$RegisteredFromJson(Map<String, dynamic> json) => Registered(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      age: json['age'] as int?,
    );

Map<String, dynamic> _$RegisteredToJson(Registered instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'age': instance.age,
    };
