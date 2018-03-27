import 'dart:convert';

import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;

import 'package:dukandaar/datamodel/store.dart';

class StoresPageState extends State<StoresPage> {
  var _stores = <Store>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();

    // NOT USED for now
    //_loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      floatingActionButton: new FloatingActionButton(
        onPressed: _addData,
        tooltip: 'Add',
        child: new Icon(Icons.add)
      ),
      body:  new ListView.builder(
          itemCount: _stores.length * 2,
          itemBuilder: (BuildContext context, int position) {
              if (position.isOdd) return new Divider();

              final index = position ~/ 2;

              return _buildRow(index);
            }
          ),
    );   
  }

  Widget _buildRow(int i) {
    return new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new ListTile(
          title: new Text(_stores[i].name, style: _biggerFont),
          subtitle: new Text(_stores[i].description, style: _biggerFont),                    
        )
    );
  }

  _addData(){
    setState((){
      // add new store here, 
       final member = new Store("dummy" + "${_stores.length}","description");
        _stores.add(member);
    });    
  }

  // NOT USED for now
  _loadData() async {
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataURL);
    setState(() {
      final membersJSON = JSON.decode(response.body);

      for (var memberJSON in membersJSON) {
        final member = new Store(memberJSON["login"], memberJSON["avatar_url"]);
        _stores.add(member);
      }
    });
  }
}

class StoresPage extends StatefulWidget {
  @override
  createState() => new StoresPageState();
}