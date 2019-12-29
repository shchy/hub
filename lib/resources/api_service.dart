import 'dart:convert';

import 'package:http/http.dart';
import 'package:mm/models/project.dart';
import 'package:mm/resources/api_interface.dart';

class ApiService implements ApiInterface {
  static const String auth_path = '/api/v1/auth';
  static const String project_path = '/api/v1/project';

  Client _client;
  ApiService(this._client);

  @override
  Future<String> login(String id, String password) {
    return _postJson(auth_path, {"id": id, "password": password});
  }

  @override
  Future<Iterable<Project>> getProjects() {
    var response = _get(project_path);
    return response
        .then(json.decode)
        .then((x) => (x as List).map((item) => Project.fromJson(item)));
  }

  Future<String> _get(String url) async {
    var response = await _client.get(project_path);
    var isOK = 200 <= response.statusCode && response.statusCode <= 299;
    if (!isOK) {
      var log = 'http error url=$url code=${response.statusCode}';
      print(log);
      throw log;
    }
    return response.body;
  }

  Future<String> _postJson(String url, Map content) async {
    var response = await _client.post(auth_path,
        body: json.encode(content),
        headers: {"Content-Type": "application/json"});
    var isOK = 200 <= response.statusCode && response.statusCode <= 299;
    if (!isOK) {
      var log = 'http error url=$url code=${response.statusCode}';
      print(log);
      throw log;
    }
    return response.body;
  }
}
