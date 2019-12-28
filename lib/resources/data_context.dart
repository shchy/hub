import 'package:shared_preferences/shared_preferences.dart';

abstract class IDataContext {
  Future<String> getToken();
  Future<void> setToken(String token);
}

class DataContext implements IDataContext {
  @override
  Future<String> getToken() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    return token;
  }

  @override
  Future<void> setToken(String token) async {
    var prefs = await SharedPreferences.getInstance();
    print(token);
    return prefs.setString('token', token);
  }
}
