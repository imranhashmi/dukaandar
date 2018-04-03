import 'dart:convert';

import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;

import 'package:dukandaar/datamodel/store.dart';
import 'package:dukandaar/pages/store_form.dart';

class StoresPageState extends State<StoresPage> {
  var _items = <Store>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return new Scaffold (
      floatingActionButton: new FloatingActionButton(
        onPressed: () { _showForm(context); },
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

  _addData(Store item){
    setState((){
      // add new item here, 
       item.name += "${_items.length}";
      _items.add(item);
    });    
  }

  _showForm(BuildContext context) async {
    Store item = await Navigator.of(context).push(
      new MaterialPageRoute<Store>(
        builder: (BuildContext context) {
          return new StoreForm();
        }
      )
    );
    if(item != null){
      _addData(item);
    }
  }

  // NOT USED for now
  _getDataFromServer() async {
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataURL);
    setState(() {
      final membersJSON = JSON.decode(response.body);

      for (var memberJSON in membersJSON) {
        final member = new Store(memberJSON["login"], memberJSON["avatar_url"]);
        _items.add(member);
      }
    });
  }
}

class StoresPage extends StatefulWidget {
  @override
  createState() => new StoresPageState();
}