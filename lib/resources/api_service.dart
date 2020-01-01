import 'dart:convert';

import 'package:http/http.dart';
import 'package:mm/bloc/auth_bloc.dart';
import 'package:mm/models/project.dart';
import 'package:mm/resources/api_interface.dart';

class ApiService implements ApiInterface {
  static const String auth_path = '/api/v1/auth';
  static const String project_path = '/api/v1/project';

  AuthState Function() _getAuthState;
  Function _logout;
  Client _client;
  ApiService(this._client, this._logout, this._getAuthState);

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
    return _client.get(project_path, headers: headers).then(_takeBody);
  }

  Future<String> _postJson(String url, Map content) async {
    var headers = {"Content-Type": "application/json"};
    _addAuthHeader(headers);
    return _client
        .post(auth_path, body: json.encode(content), headers: headers)
        .then(_takeBody);
  }

  String _takeBody(Response response) {
    var isOK = 200 <= response.statusCode && response.statusCode <= 299;
    if (!isOK) {
      var log =
          'http error url=${response.request.url} code=${response.statusCode}';
      print(log);
      if (response.statusCode == 401) _logout();
      throw log;
    }
    return response.body;
  }

  void _addAuthHeader(Map<String, String> headers) {
    var state = _getAuthState();
    if (state is! LoggedIn) return;
    headers['Authorization'] = 'Bearer ${(state as LoggedIn).token}';
  }
}
