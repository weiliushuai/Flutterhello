import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  PopupMenuButtonDemo({Key key}) : super(key: key);

  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String _currentIndex = "Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupMenuButtonDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_currentIndex),
                PopupMenuButton(
                    //  icon: Icon(Icons.more),
                    onSelected: (value) {
                      debugPrint("value:$value");
                      setState(() {
                        _currentIndex = value;
                      });
                    },
                    itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            child: Text("Home"),
                            value: "Home",
                          ),
                          PopupMenuItem(
                            child: Text("Discover"),
                            value: "Discover",
                          ),
                          PopupMenuItem(
                            child: Text("History"),
                            value: "History",
                          ),
                        ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
