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
            Wrap(//可换行
            //  mainAxisAlignment: MainAxisAlignment.center,
            direction: Axis.horizontal,//部件摆放方向，默认为水平方向
            alignment: WrapAlignment.center,//对其方式
            textDirection: TextDirection.ltr,
            spacing: 15.0,//设置间距
            runSpacing: 8.0,//行间距
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
