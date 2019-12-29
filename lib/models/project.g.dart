// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project(
    json['id'] as int,
    json['name'] as String,
    (json['users'] as List)?.map(
        (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>)),
    (json['tasks'] as List)?.map(
        (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>)),
    (json['budgets'] as List)?.map(
        (e) => e == null ? null : Budget.fromJson(e as Map<String, dynamic>)),
    (json['iterations'] as List)?.map((e) =>
        e == null ? null : Iteration.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'users': instance.users?.toList(),
      'tasks': instance.tasks?.toList(),
      'budgets': instance.budgets?.toList(),
      'iterations': instance.iterations?.toList(),
    };
