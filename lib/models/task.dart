import 'package:json_annotation/json_annotation.dart';
import 'task_state.dart';
import 'user.dart';
part 'task.g.dart';

@JsonSerializable()
class Task {
  int id;
  String name;

  TaskState state;
  User assign;

  Task(this.id, this.name, this.state, this.assign);

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
