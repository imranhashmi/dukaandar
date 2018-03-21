import 'package:flutter/material.dart';

import 'package:dukandaar/strings.dart';
import 'package:dukandaar/pages/profile_page.dart';
import 'package:dukandaar/pages/surveys_page.dart';
import 'package:dukandaar/pages/stores_page.dart';
import 'package:dukandaar/pages/managers_page.dart';
import 'package:dukandaar/pages/statistics_page.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem(Strings.profileTitle, Icons.person),
    new DrawerItem(Strings.surveysTitle, Icons.book),
    new DrawerItem(Strings.storesTitle, Icons.store),
    new DrawerItem(Strings.managersTitle, Icons.group),
    new DrawerItem(Strings.statisticsTitle, Icons.pie_chart),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

   _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new ProfilePage();
      case 1:
        return new SurveysPage();
      case 2:
        return new StoresPage();
      case 3:
        return new ManagersPage();
      case 4:
        return new StatisticsPage();  

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Admin"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}