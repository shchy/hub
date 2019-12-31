import 'package:bloc/bloc.dart';
import 'package:mm/models/project.dart';
import 'package:mm/resources/api_interface.dart';

abstract class ProjectEvent {}

class GetEvent implements ProjectEvent {}

class CreateEvent implements ProjectEvent {
  String id;
  String name;
  CreateEvent(this.id, this.name);
}

class ProjectBloc extends Bloc<ProjectEvent, Iterable<Project>> {
  ApiInterface _api;
  ProjectBloc(this._api) {
    Stream.periodic(Duration(seconds: 15)).listen((_) => this.add(GetEvent()));
  }

  @override
  Iterable<Project> get initialState => [];

  @override
  Stream<Iterable<Project>> mapEventToState(ProjectEvent event) async* {
    switch (event.runtimeType) {
      case GetEvent:
        yield await _api.getProjects().catchError((_) => []);
        break;
    }
  }
}
