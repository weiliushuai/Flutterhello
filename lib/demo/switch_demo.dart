import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switch_item = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SwitchDemo"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              value: _switch_item,
              onChanged: (value) {
                setState(() {
                  _switch_item = value;
                });
              },
              title: Text("Switch"),
              subtitle: Text("description"),
              selected: _switch_item,
              secondary: Icon(
                _switch_item ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //  Text(_switch_item ? '😁' : '😐',style: TextStyle(fontSize: 32.0)),
                //  Switch(
                //    value: _switch_item,
                //    onChanged: (value){
                //      setState(() {
                //        _switch_item = value;
                //      });
                //    }
                //     ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
