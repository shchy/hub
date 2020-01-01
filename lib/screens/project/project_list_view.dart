import 'package:flutter/material.dart';
import 'package:mm/components/app_bar.dart';
import 'package:mm/components/menu.dart';
import 'package:mm/screens/project/project_list_content.dart';

class ProjectListView extends StatelessWidget {
  ProjectListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Project List'),
      drawer: SafeArea(
        child: Drawer(child: SideMenu()),
      ),
      body: ProjectListContent(),
    );
  }
}
