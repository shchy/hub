import 'package:flutter/material.dart';

class NavItem {
  IconData icon;
  String text;
  Widget Function() makeWidget;
  NavItem(this.icon, this.text, this.makeWidget);
}

abstract class BottomNavView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavViewState(
      makeAppBar(),
      makeDrawer(),
      makeNavItem(),
    );
  }

  PreferredSizeWidget makeAppBar();

  Widget makeDrawer();

  Iterable<NavItem> makeNavItem();
}

class BottomNavViewState extends State<BottomNavView> {
  int _currentIndex = 0;
  Iterable<NavItem> _navs;
  PreferredSizeWidget _appBar;
  Widget _drawer;
  BottomNavViewState(this._appBar, this._drawer, this._navs);

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
      appBar: _appBar,
      drawer: _drawer,
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
