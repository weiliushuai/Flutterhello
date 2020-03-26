import 'package:flutter/material.dart';
import 'dart:async';

class BottonSheetDemo extends StatefulWidget {
  @override
  _BottonSheetDemoState createState() => _BottonSheetDemoState();
}

class _BottonSheetDemoState extends State<BottonSheetDemo> {
  String _choice = "Nothing";
  final _bottomSheetScaffold = GlobalKey<ScaffoldState>();
  _openBottonSheet() {
    _bottomSheetScaffold.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(8.0),
          color: Colors.black.withOpacity(0.3),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              Text("01:32/04:54"),
              Expanded(
                  child: Text(
                "Beyond -- 真的爱你",
                textAlign: TextAlign.right,
              )),
            ],
          ),
        ),
      );
    });
  }

  Future _openModelBottonSheet() async{
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            width: double.infinity,
            child: Column(children: <Widget>[
              ListTile(
                title: Text("Option A"),
                onTap: (){
                  Navigator.pop(context,"A");
                },
              ),
              ListTile(
                title: Text("Option B"),
                 onTap: (){
                  Navigator.pop(context,"B");
                },
              ),
              ListTile(
                title: Text("Option C"),
                 onTap: (){
                  Navigator.pop(context,"C");
                },
              ),
            ]),
          );
        });
        switch (option) {
          case "A":
            setState(() {
              _choice = "A";
            });
            break;
            case "B":
            setState(() {
              _choice = "B";
            });
            break;
            case "C":
            setState(() {
              _choice = "C";
            });
            break;
          default:
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffold,
      appBar: AppBar(
        title: Text("BottomSheetDemo"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Your choice is $_choice"),
            SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("Open BottomSheet"),
                  onPressed: _openBottonSheet,
                ),
                FlatButton(
                  child: Text("Open MoelBottomSheet"),
                  onPressed: _openModelBottonSheet,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
