import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  String _value = '';
  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();

  void _showBar(String message) {
    _scaffoldstate.currentState.showSnackBar(new SnackBar(content: new Text(message)));
  }

  void _onChanged(String value) {
    setState((){
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldstate,
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Enter your name'),
              new TextField(onChanged: _onChanged,),
              new RaisedButton(onPressed: () => _showBar('Hello ${_value}'), child: new Text('Click me'),)
            ],
          ),
        )
      ),
    );
  }
}
