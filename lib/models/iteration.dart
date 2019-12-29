import 'package:json_annotation/json_annotation.dart';
import 'package:mm/models/task.dart';

part 'iteration.g.dart';

@JsonSerializable()
class Iteration {
  int id;
  String name;
  DateTime start;
  DateTime end;
  Iterable<Task> tasks;

  Iteration(this.id, this.name, this.start, this.end, this.tasks);

  factory Iteration.fromJson(Map<String, dynamic> json) =>
      _$IterationFromJson(json);
  Map<String, dynamic> toJson() => _$IterationToJson(this);
}
