import 'package:mm/resources/api_interface.dart';

class DebugApi implements ApiInterface {
  @override
  Future<String> login(String id, String password) {
    return Future.value("debug token");
  }
}
