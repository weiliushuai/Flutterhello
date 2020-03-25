import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _item_select = 0;
  void _itemGroupBuild(int value) {
    setState(() {
      _item_select = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RadioDemo")),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("RadioListTitle: $_item_select"),
            SizedBox(
              height: 16.0,
            ),
            RadioListTile(
              value: 0,
              groupValue: _item_select,
              onChanged: _itemGroupBuild,
              title: Text("RadioListTitleA"),
              subtitle: Text("Description"),
              secondary: Icon(Icons.filter_1),
              activeColor: Colors.black,
              selected: _item_select == 0,
            ),
            RadioListTile(
              value: 1,
              groupValue: _item_select,
              onChanged: _itemGroupBuild,
              title: Text("RadioListTitleB"),
              subtitle: Text("Description"),
              secondary: Icon(Icons.filter_2),
              activeColor: Colors.black,
              selected: _item_select == 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Radio(
                //   value: 0,
                //   groupValue: _item_select,
                //   onChanged: _itemGroupBuild,
                // ),
                // Radio(
                //   value: 1,
                //   groupValue: _item_select,
                //   onChanged: _itemGroupBuild,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
