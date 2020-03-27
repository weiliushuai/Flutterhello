import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tag = ["Apple", "Banana", "Orange"];

  String _action = "Nothing";

  List<String> _selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChipDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              //可换行
              //  mainAxisAlignment: MainAxisAlignment.center,
              //   direction: Axis.horizontal, //部件摆放方向，默认为水平方向
              //   alignment: WrapAlignment.center, //对其方式
              //   textDirection: TextDirection.ltr,
              spacing: 15.0, //设置间距
              runSpacing: 8.0, //行间距

              children: <Widget>[
                Chip(
                  label: Text("History"),
                  elevation: 4.0,
                  labelPadding: EdgeInsets.all(5.0),
                ),
                Chip(
                  label: Text("History"),
                  backgroundColor: Colors.green,
                  avatar: Icon(Icons.flag),
                  labelStyle: TextStyle(color: Colors.white),
                  elevation: 4.0,
                  labelPadding: EdgeInsets.all(5.0),
                ),
                Chip(
                  label: Text("宁浩"),
                  avatar: CircleAvatar(
                    child: Text("皓"),
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  elevation: 4.0,
                  labelPadding: EdgeInsets.all(5.0),
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
                Chip(
                  label: Text("Delect"),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete), //删除图标
                  deleteIconColor: Colors.redAccent, //图标颜色
                  deleteButtonTooltipMessage: "Remove this Tag", //长安图标提示语
                ),
                Divider(
                  //分隔符
                  color: Colors.grey,
                  height: 22.0, //距离上部的距离
                  //   indent: 16.0,//左边的缩进
                  endIndent: 16.0, //右边的缩进
                  //  thickness: 0.5,//分割线的高度
                ),
                Wrap(
                  spacing: 12.0,
                  children: _tag.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tag.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  //分隔符
                  color: Colors.grey,
                  height: 22.0, //距离上部的距离
                  //   indent: 16.0,//左边的缩进
                  endIndent: 16.0, //右边的缩进
                  //   thickness: 0.5,//分割线的高度
                ),
                Container(
                  width: double.infinity,
                  child: Text("Action:$_action"),
                ),
                Wrap(
                  spacing: 12.0,
                  children: _tag.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                  Divider(
                  //分隔符
                  color: Colors.grey,
                  height: 22.0, //距离上部的距离
                  //   indent: 16.0,//左边的缩进
                  endIndent: 16.0, //右边的缩进
                  //   thickness: 0.5,//分割线的高度
                ),
                Container(
                  width: double.infinity,
                  child: Text("FliterAction:${_selected.toString()}"),
                ),
                Wrap(
                  spacing: 12.0,
                  children: _tag.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value){
                          setState(() {
                            if (_selected.contains(tag)) {
                              _selected.remove(tag);

                            } else {
                              _selected.add(tag);

                            }
                          });
                      },
                    );
                  }).toList(),
                ),
              ],
              
            ),
           
              ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.restore),
          onPressed: () {
            setState(() {
              _tag = ["Apple", "Banana", "Orange"];
              _selected = [];
            });
          }),
    );
  }
}
