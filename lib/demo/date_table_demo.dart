import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _pos = posts;
  int _selectCount = 0;
  @override
  int get rowCount => _pos.length; //一共有多少行

  @override
  int get selectedRowCount => _selectCount; //被选中的行数

  @override
  bool get isRowCountApproximate => false;

  @override
  DataRow getRow(int index) {//展示的数据
    Post pos = _pos[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text(pos.title)),
      DataCell(Text(pos.author)),
      DataCell(Image.network(pos.imageUrl)),
    ]);
  }

  void sort(getField(post),bool ascedning){
     _pos.sort((a,b){
        if(!ascedning){
          final c = a;
          a = b;
          b = c;
        }
        final aValue = getField(a);
        final bValue = getField(b);
        return Comparable.compare(aValue, bValue);
     });

     notifyListeners();//刷新列表
  }
}

class DateTableDemo extends StatefulWidget {
  @override
  _DateTableDemoState createState() => _DateTableDemoState();
}

class _DateTableDemoState extends State<DateTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  final PostDataSource _postDataSource = PostDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DateTableDemo")),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(children: <Widget>[
          PaginatedDataTable(
            header: Text("Post"),
            source: _postDataSource,
            rowsPerPage: 5,//默认每页显示人数为10
            sortColumnIndex: _sortColumnIndex, //排序的栏目
            sortAscending: _sortAscending,

            columns: [
              DataColumn(
                label: Text("Title"),
                onSort: (int index, bool ascending) {
                  _postDataSource.sort((post)=> post.title.length,ascending);
                  setState(() {
                    _sortColumnIndex = index;
                    _sortAscending = ascending;

                
                  });
                },
              ),
              DataColumn(label: Text("Author")),
              DataColumn(label: Text("Image")),
            ],
            // rows: posts.map((pos) {
            //   return DataRow(
            //       selected: pos.selected,
            //       onSelectChanged: (bool value) {
            //         setState(() {
            //           if (pos.selected != value) {
            //             pos.selected = value;
            //           }
            //         });
            //       },
            //       cells: [
            //         DataCell(Text(pos.title)),
            //         DataCell(Text(pos.author)),
            //         DataCell(Image.network(pos.imageUrl)),
            //       ]);
            // }).toList(),
          ),
        ]),
      ),
    );
  }
}
