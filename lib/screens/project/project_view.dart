import 'package:flutter/material.dart';
import 'package:mm/components/app_bar.dart';
import 'package:mm/components/menu.dart';
import 'package:mm/models/project.dart';

class ProjectView extends StatelessWidget {
  final Project _project;
  ProjectView(this._project);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_project.name),
      drawer: SafeArea(
        child: Drawer(child: SideMenu()),
      ),
      body: Container(
        padding: EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.blue,
              child: Text(
                _project.name,
                style: Theme.of(context).primaryTextTheme.title,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                child: ListView.builder(
                  itemCount: _project.tasks.length,
                  itemBuilder: (context, index) {
                    var item = _project.tasks.elementAt(index);
                    return Text(item.name);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // body: Container(
      //   padding: EdgeInsets.all(6),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.max,
      //     children: <Widget>[
      //       Text(
      //         _project.name,
      //         style: Theme.of(context).primaryTextTheme.title,
      //       ),
      //       ListView.builder(
      //         itemCount: _project.tasks.length,
      //         itemBuilder: (context, index) {
      //           var item = _project.tasks.elementAt(index);
      //           return Text(item.name);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
