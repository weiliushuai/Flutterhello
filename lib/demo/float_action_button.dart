import 'package:flutter/material.dart';

class FloatActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _floatActionButton = FloatingActionButton(
      onPressed: () {
        debugPrint("Add...");
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      backgroundColor: Colors.blue,
      //  elevation: 0.0,
      //  shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );

    final _floatActionButtonExtend = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text("Add"),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonDemo"),
        elevation: 0.0,
      ),
      floatingActionButton: _floatActionButton,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, //与底部导航栏重叠
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
