import 'package:json_annotation/json_annotation.dart';
import 'package:mm/models/iteration.dart';
import 'package:mm/models/task.dart';
import 'budget.dart';
import 'user.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  int id;
  String name;
  Iterable<User> users;
  Iterable<Task> tasks;
  Iterable<Budget> budgets;
  Iterable<Iteration> iterations;

  Project(this.id, this.name, this.users, this.tasks, this.budgets,
      this.iterations);

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
