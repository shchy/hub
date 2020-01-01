import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/bloc/project_bloc.dart';
import 'package:mm/models/project.dart';
import 'package:mm/routes/routes.dart';
import 'package:provider/provider.dart';

class ProjectListContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var router = Provider.of<Router>(context);

    return BlocBuilder<ProjectBloc, Iterable<Project>>(
      builder: (context, projects) => ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var project = projects.elementAt(index);
          return ListTile(
            onTap: () => router.navigateTo(
                context, Routes.makeProjectPath(project.id),
                replace: true),
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
