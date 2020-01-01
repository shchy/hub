import 'package:flutter/material.dart';
import 'package:mm/components/menu.dart';
import 'package:mm/screens/project/project_list_content.dart';

class ProjectListView extends StatelessWidget {
  ProjectListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
        elevation: 0.0,
      ),
      drawer: SafeArea(
        child: Drawer(child: SideMenu()),
      ),
      body: ProjectListContent(),
    );
  }
}
