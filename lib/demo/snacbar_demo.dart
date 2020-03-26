import 'package:flutter/material.dart';

class SnackBarDemo extends StatefulWidget {
  SnackBarDemo({Key key}) : super(key: key);

  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SnackBarDemo")),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[SnackbarButton()],
            ),
          ],
        ),
      ),
    );
  }
}

class SnackbarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text("Open SnackBar"),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("progress..."),
            action: SnackBarAction(
              label: "ok",
              onPressed: () {},
            )));
      },
    );
  }
}
