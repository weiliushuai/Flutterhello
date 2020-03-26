import 'package:flutter/material.dart';
import 'dart:async';

enum Action { Ok, Cancel }

class AlerDialogDemo extends StatefulWidget {
  @override
  _AlerDialogDemoState createState() => _AlerDialogDemoState();
}

class _AlerDialogDemoState extends State<AlerDialogDemo> {
  String _choice = "Nothing";
  _openAlerDialog() async {
    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("AlerDialog"),
            content: Text("Are you sure about this ?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context, Action.Cancel);
                },
              ),
              FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context, Action.Ok);
                  }),
            ],
          );
        });
    switch (option) {
      case Action.Cancel:
        setState(() {
          _choice = "Cancel";
        });
        break;
      case Action.Ok:
        setState(() {
          _choice = "Ok";
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlerDialogDemo"),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Your choice is $_choice"),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: _openAlerDialog,
                    child: Text("Open AlerDialog"),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
