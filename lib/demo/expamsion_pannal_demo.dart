import 'package:flutter/material.dart';

class ExPansionpannel {
  String headeritem;
  Widget body;
  bool isExpand;

  ExPansionpannel({this.headeritem, this.body, this.isExpand});
}

class ExpansionPannalDemo extends StatefulWidget {
  @override
  _ExpansionPannalDemoState createState() => _ExpansionPannalDemoState();
}

class _ExpansionPannalDemoState extends State<ExpansionPannalDemo> {
  bool _isExpand = false;
  List<ExPansionpannel> _exPansionpannel;

  @override
  void initState() {
    super.initState();
    _exPansionpannel = <ExPansionpannel>[
      ExPansionpannel(
          headeritem: "Pannel A",
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.0),
            child: Text("Pananel Context A"),
          ),
          isExpand: false),
      ExPansionpannel(
          headeritem: "Pannel B",
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.0),
            child: Text("Pananel Context B"),
          ),
          isExpand: false),
      ExPansionpannel(
          headeritem: "Pannel C",
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.0),
            child: Text("Pananel Context C"),
          ),
          isExpand: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExPansionPannalDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
            ExpansionPanelList(
                expansionCallback: (int currentIdnex, bool isExpanded) {
                  setState(() {
                    _exPansionpannel[currentIdnex].isExpand = !isExpanded;
                  });
                },
                children: _exPansionpannel.map((ExPansionpannel item) {
                  return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            item.headeritem,
                            style: Theme.of(context).textTheme.title,
                          ),
                        );
                      },
                      body: item.body,
                      isExpanded: item.isExpand);
                }).toList()),
          ],
        ),
      ),
    );
  }
}
