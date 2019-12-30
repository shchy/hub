import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/bloc/project_bloc.dart';
import 'package:mm/models/project.dart';

class ProjectContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, Iterable<Project>>(
      builder: (context, projects) => ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var project = projects.elementAt(index);
          return ListTile(
            onTap: () => print('tap ${project.name}'),
            leading: Icon(Icons.hotel),
            subtitle: Text('sub'),
            title: Text(project.name),
            trailing: Text(project.name),
          );
        },
        itemCount: projects.length,
      ),
    );
  }
}
