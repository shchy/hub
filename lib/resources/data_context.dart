import 'package:localstorage/localstorage.dart';

abstract class IDataContext {
  Future<String> getToken();
  Future<void> setToken(String token);
}

class DataContext implements IDataContext {
  final LocalStorage storage = new LocalStorage('auth');

  @override
  Future<String> getToken() async {
    await storage.ready;
    return storage.getItem('token');
  }

  @override
  Future<void> setToken(String token) async {
    await storage.ready;
    return storage.setItem('token', token);
  }
}
