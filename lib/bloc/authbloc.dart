import 'package:bloc/bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mm/app.dart';
import 'package:mm/resources/api_interface.dart';

abstract class AuthEvent {}

class LoginEvent implements AuthEvent {
  String id;
  String password;
  LoginEvent(this.id, this.password);
}

class LogoutEvent implements AuthEvent {}

class AuthBloc extends Bloc<AuthEvent, bool> {
  final LocalStorage storage = new LocalStorage('auth');
  ApiInterface _api;
  Application _app;
  AuthBloc(this._api, this._app);

  @override
  bool get initialState => false;

  @override
  Stream<bool> mapEventToState(AuthEvent event) async* {
    switch (event.runtimeType) {
      case LoginEvent:
        var login = event as LoginEvent;
        var token = await _api.login(login.id, login.password);
        if (token == null) {
          yield false;
        } else {
          _app.token = token;
          await storage.setItem('token', token);
          yield true;
        }
        break;
      case LogoutEvent:
        _app.clear();
        await storage.deleteItem('token');
        yield false;
        break;
    }
  }
}
