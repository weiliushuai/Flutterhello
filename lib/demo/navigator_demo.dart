import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: null, 
              child: Text("Home")
              ),
              FlatButton(
              child: Text("About"),
              onPressed: (){
                Navigator.pushNamed(context, "/about");
                }, 
              ),
          ],
        ),
      ),
    );
  }
}

class PageDemo extends StatelessWidget {
  final String title;
 PageDemo({
   this.title
 });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title:Center(
         child: Text(title),
       ),
     ), 
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.arrow_back),
       onPressed:(){
         Navigator.pop(context);
       },
       ),
    );
  }
}