import 'package:flutter/material.dart';
import 'package:mm/components/app_bar.dart';
import 'package:mm/components/menu.dart';
import 'package:mm/models/project.dart';
import 'package:mm/screens/bottom_nav_template.dart';

import 'task_view.dart';

class ProjectView extends BottomNavView {
  final Project _project;
  ProjectView(this._project);

  @override
  PreferredSizeWidget makeAppBar() {
    return MyAppBar(_project.name);
  }

  @override
  Widget makeDrawer() {
    return SafeArea(
      child: Drawer(child: SideMenu()),
    );
  }

  @override
  Iterable<NavItem> makeNavItem() {
    return [
      NavItem(Icons.home, 'Home', () => TaskView(_project)),
      NavItem(Icons.photo_album, 'photo_album', () => TaskView(_project)),
      NavItem(Icons.chat, 'chat', () => TaskView(_project)),
    ];
  }
}
