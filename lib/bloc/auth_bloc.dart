import 'package:bloc/bloc.dart';
import 'package:mm/app.dart';
import 'package:mm/resources/api_interface.dart';
import 'package:mm/resources/data_context.dart';

abstract class AuthEvent {}

class LoginEvent implements AuthEvent {
  String id;
  String password;
  LoginEvent(this.id, this.password);
}

class LogoutEvent implements AuthEvent {}

class AuthBloc extends Bloc<AuthEvent, bool> {
  ApiInterface _api;
  Application _app;
  IDataContext _dataContext;
  AuthBloc(this._api, this._app, this._dataContext);

  @override
  bool get initialState => _app.token != null;

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
          await _dataContext.setToken(token);
          yield true;
        }
        break;
      case LogoutEvent:
        _app.clear();
        await _dataContext.setToken(null);
        yield false;
        break;
    }
  }
}
