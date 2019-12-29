// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iteration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Iteration _$IterationFromJson(Map<String, dynamic> json) {
  return Iteration(
    json['id'] as int,
    json['name'] as String,
    json['start'] == null ? null : DateTime.parse(json['start'] as String),
    json['end'] == null ? null : DateTime.parse(json['end'] as String),
    (json['tasks'] as List)?.map(
        (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$IterationToJson(Iteration instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'tasks': instance.tasks?.toList(),
    };
