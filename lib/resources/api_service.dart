import 'dart:convert';

import 'package:http/http.dart';
import 'package:mm/models/project.dart';
import 'package:mm/resources/api_interface.dart';
import 'package:mm/app.dart';

class ApiService implements ApiInterface {
  static const String auth_path = '/api/v1/auth';
  static const String project_path = '/api/v1/project';

  Client _client;
  Application _app;
  ApiService(this._client, this._app);

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
    Map<String, String> headers = {};
    _addAuthHeader(headers);
    var response = await _client.get(
      project_path,
      headers: headers,
    );
    var isOK = 200 <= response.statusCode && response.statusCode <= 299;
    if (!isOK) {
      var log = 'http error url=$url code=${response.statusCode}';
      print(log);
      throw log;
    }
    return response.body;
  }

  Future<String> _postJson(String url, Map content) async {
    var headers = {"Content-Type": "application/json"};
    _addAuthHeader(headers);
    var response = await _client.post(auth_path,
        body: json.encode(content), headers: headers);
    var isOK = 200 <= response.statusCode && response.statusCode <= 299;
    if (!isOK) {
      var log = 'http error url=$url code=${response.statusCode}';
      print(log);
      throw log;
    }
    return response.body;
  }

  void _addAuthHeader(Map<String, String> headers) {
    if (_app.token == null) return;
    headers['Authorization'] = 'Bearer ${_app.token}';
  }
}
