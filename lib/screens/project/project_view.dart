import 'package:flutter/material.dart';
import 'package:mm/components/app_bar.dart';
import 'package:mm/components/menu.dart';
import 'package:mm/models/project.dart';

import 'task_view.dart';

class NavItem {
  IconData icon;
  String text;
  Widget Function() makeWidget;
  NavItem(this.icon, this.text, this.makeWidget);
}

class ProjectView extends StatefulWidget {
  final Project _project;
  ProjectView(this._project);

  @override
  State<StatefulWidget> createState() {
    return ProjectViewState([
      NavItem(Icons.home, 'Home', () => TaskView(_project)),
      NavItem(Icons.photo_album, 'photo_album', () => TaskView(_project)),
      NavItem(Icons.chat, 'chat', () => TaskView(_project)),
    ]);
  }
}

class ProjectViewState extends State<ProjectView> {
  int _currentIndex = 0;
  Iterable<NavItem> _navs;
  ProjectViewState(this._navs);

  Widget _page(int index) {
    if (_navs.length <= index) return Text('not registed widget index=$index');
    return _navs.elementAt(index).makeWidget();
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    var items = _navs
        .map((x) =>
            BottomNavigationBarItem(icon: Icon(x.icon), title: Text(x.text)))
        .toList();

    return Scaffold(
      appBar: MyAppBar(widget._project.name),
      drawer: SafeArea(
        child: Drawer(child: SideMenu()),
      ),
      body: _page(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _currentIndex,
        fixedColor: Colors.blueAccent,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
