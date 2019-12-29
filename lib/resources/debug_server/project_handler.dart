import 'dart:convert';

import 'package:http/http.dart';
import 'package:mm/models/budget.dart';
import 'package:mm/models/iteration.dart';
import 'package:mm/models/project.dart';
import 'package:mm/models/task.dart';
import 'package:mm/models/user.dart';
import 'package:mm/resources/api_service.dart';

import 'debug_handler.dart';

class ProjectHandler extends DebugHandler {
  List<Project> _project;
  ProjectHandler() : super(matchPath(ApiService.project_path)) {
    _project = List.generate(
      10,
      (i) {
        var users = List.generate(3, (id) => User('$id', 'name_$id'));
        var tasks = List.generate(9, (id) => Task(id, 'name_$id'));
        var budgets = List.generate(3, (id) => Budget(id, 'name_$id'));
        var iterations = List.generate(
            3,
            (id) => Iteration(
                id,
                'name_$id',
                DateTime.now(),
                DateTime.now().add(Duration(days: id)),
                tasks.skip(id * 3).take(3).toList()));
        return Project(i, 'project_$i', users, tasks, budgets, iterations);
      },
    );
  }

  @override
  Map<String, Handler> makeHandlers() => {
        'GET': _get,
      };

  Response _get(Request req) => Response(json.encode(_project), 200);
}
