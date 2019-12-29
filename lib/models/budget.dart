import 'package:json_annotation/json_annotation.dart';

part 'budget.g.dart';

@JsonSerializable()
class Budget {
  int id;
  String name;

  Budget(this.id, this.name);

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);
  Map<String, dynamic> toJson() => _$BudgetToJson(this);
}
