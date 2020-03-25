import 'package:flutter/material.dart';
import '../model/post.dart';

class ListDetailDemo extends StatelessWidget {
  final int index;
  ListDetailDemo({this.index});
  Widget _detailBuild(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
          Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0),
            child: Text(
              posts[index].description,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
            ),
          ),
        ]),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(posts[index].title),
        ),
      ),
      body: Container(child: _detailBuild(context)),
    );
  }
}
