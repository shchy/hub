import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/bloc/project_bloc.dart';
import 'package:mm/models/project.dart';

class Test extends StatelessWidget {
  Test({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
        elevation: 0.0,
      ),
      body: BlocBuilder<ProjectBloc, Iterable<Project>>(
        builder: (context, projects) => ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var project = projects.elementAt(index);
            return Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () => print('tap ${project.name}'),
                child: Container(
                  width: 320,
                  height: 240,
                  child: Text(project.name),
                ),
              ),
            );
          },
          itemCount: projects.length,
        ),
      ),
    );
  }
}
