import 'package:flutter/material.dart';
import 'package:mm/components/menu.dart';
import 'package:mm/screens/project/project_content.dart';

class ProjectView extends StatelessWidget {
  ProjectView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
        elevation: 0.0,
      ),
      drawer: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: SideMenu(),
      ),
      body: ProjectContent(),
    );
  }
}
