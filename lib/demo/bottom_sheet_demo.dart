import 'package:flutter/material.dart';

class BottonSheetDemo extends StatefulWidget {
  @override
  _BottonSheetDemoState createState() => _BottonSheetDemoState();
}

class _BottonSheetDemoState extends State<BottonSheetDemo> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("Open BottomSheet"),
                  onPressed: _openBottonSheet,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
