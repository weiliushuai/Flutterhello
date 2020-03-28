import 'package:flutter/material.dart';
import '../model/post.dart';

class DateTableDemo extends StatefulWidget {
  @override
  _DateTableDemoState createState() => _DateTableDemoState();
}

class _DateTableDemoState extends State<DateTableDemo> {
     int _sortColumnIndex;
    bool _sortAscending = true;
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(title: Text("DateTableDemo")),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              sortColumnIndex: _sortColumnIndex,//排序的栏目
              sortAscending: _sortAscending,
              columns: [
              DataColumn(
                label: Text("Title"),
                onSort: (int index,bool ascending){
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;

                      posts.sort((a,b){
                        if(!ascending){
                          final c = a;
                          a = b;
                          b = c;
                        
                        }
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                    
                },
                ),
              DataColumn(label: Text("Author")),
               DataColumn(label: Text("Image")),
            ],
             rows: posts.map((pos){
               
               return DataRow(
                 selected: pos.selected,
                 onSelectChanged: (bool value){
                   setState(() {
                      if(pos.selected != value){
                      pos.selected = value;
                    }
                   });
                 },
                 cells: [              
                   DataCell(Text(pos.title)),
                   DataCell(Text(pos.author)),
                   DataCell(
                     Image.network(pos.imageUrl)
                   ),
                 ]
                 );
             }).toList(),
              ),
            ]
            ),
      ),
    );
  }
}
