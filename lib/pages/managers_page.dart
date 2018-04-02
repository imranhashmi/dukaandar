import 'dart:convert';

import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;

import 'package:dukandaar/datamodel/manager.dart';

class ManagersPageState extends State<ManagersPage> {
  var _items = <Manager>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      floatingActionButton: new FloatingActionButton(
        onPressed: _addData,
        tooltip: 'Add',
        backgroundColor: Colors.green[400],
        child: new Icon(Icons.add)
      ),
      body:  new ListView.builder(
          itemCount: _items.length * 2,
          itemBuilder: (BuildContext context, int position) {
              if (position.isOdd) return new Divider();

              final index = position ~/ 2;

              return _buildRow(index);
            }
          ),
    );   
  }

  Widget _buildRow(int i) {
    return new Dismissible(
      key: new Key(i.toString()),
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new ListTile(
          title: new Text(_items[i].name, style: _biggerFont),
          subtitle: new Text(_items[i].description, style: _biggerFont),                        
        ),
      ),
      resizeDuration: null,
      direction: DismissDirection.horizontal,
      onDismissed: (DismissDirection direction) {
        _deleteData(_items[i]);
      },
    );
  }

  _deleteData(var item){
    setState( (){
      if(_items.contains(item))
      _items.remove(item);
    });
  }

  _addData(){
    setState((){
      // add new item here, 
      final item = new Manager("dummy" + "${_items.length}","description");
      _items.add(item);
    });    
  }

  // NOT USED for now
  _loadData() async {
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataURL);
    setState(() {
      final membersJSON = JSON.decode(response.body);

      for (var memberJSON in membersJSON) {
        final member = new Manager(memberJSON["login"], memberJSON["avatar_url"]);
        _items.add(member);
      }
    });
  }
}

class ManagersPage extends StatefulWidget {
  @override
  createState() => new ManagersPageState();
}