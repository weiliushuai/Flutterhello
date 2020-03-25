import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {


  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checkboxItem = true;
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBoxDemo"),  
      ),
      body: Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           CheckboxListTile(
             value: _checkboxItem,
              onChanged: (value){
                setState(() {
                  _checkboxItem = value;
                });
              },
               title:Text("Check Box List item"),
                subtitle: Text("Select check box"),
                secondary: Icon(Icons.book),
               checkColor: Colors.red,
             //  activeColor: Colors.black,
              
               selected: _checkboxItem,
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              //  Checkbox(
              //    value: _checkboxItem,
              //    onChanged: (value){
              //      setState(() {
              //        _checkboxItem = value;
              //      });
              //    },
              //    activeColor: Colors.black,
              //    checkColor: Colors.green,
              //    focusColor: Colors.yellow,
              //    hoverColor: Colors.red,
              //    ),
                 
             ],
           ),
         ],
       ), 
      ),
    );
  }
}