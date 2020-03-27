import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChipDemo"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Chip(
                  label: Text("History"),
                  elevation: 4.0,
                  labelPadding: EdgeInsets.all(5.0),
                ),
                SizedBox(
                  width: 12,
                ),
                Chip(
                  label: Text("History"),
                  backgroundColor: Colors.green,
                  avatar: Icon(Icons.flag),
                  labelStyle: TextStyle(color: Colors.white),
                  elevation: 4.0,
                  labelPadding: EdgeInsets.all(5.0),
                ),
                SizedBox(
                  width: 12,
                ),
                Chip(
                  label: Text("宁浩"),
                  avatar: CircleAvatar(
                    //  child: Text("皓"),
                    backgroundImage: NetworkImage(
                        "https://resources.ninghao.org/images/wanghao.jpg"),
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  elevation: 4.0,
                  labelPadding: EdgeInsets.all(5.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
