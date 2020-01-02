import 'package:flutter/material.dart';
import 'package:mm/models/project.dart';

class TaskView extends StatelessWidget {
  final Project _project;
  TaskView(this._project);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: ListView.builder(
        itemCount: _project.tasks.length,
        itemBuilder: (context, index) {
          var item = _project.tasks.elementAt(index);
          return ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Icon(Icons.assignment),
            title: Text(item.name),
            subtitle: Text('${item.state}'),
            trailing: Text(item.assign?.name ?? ''),
          );
        },
      ),
    );
  }
}
