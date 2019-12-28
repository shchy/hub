import 'dart:convert';

import 'package:http/http.dart';
import 'package:mm/resources/api_interface.dart';

class Api implements ApiInterface {
  static const String auth_path = '/api/v1/auth';

  Client _client;
  Api(this._client);
  @override
  Future<String> login(String id, String password) async {
    var response = await _client.post(auth_path,
        body: json.encode({"id": id, "password": password}));
    return response.body;
  }
}
