import 'package:mm/models/project.dart';

abstract class ApiInterface {
  Future<String> login(String id, String password);

  Future<Iterable<Project>> getProjects();
}
