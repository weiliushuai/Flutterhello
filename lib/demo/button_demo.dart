import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget flatButton = Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      FlatButton(
        onPressed: () {},
        child: Text("Button"),
        splashColor: Colors.grey[100].withOpacity(0.5),
      ),
      FlatButton.icon(
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text("Button"),
        splashColor: Colors.grey[100].withOpacity(0.5),
      ),
    ]);

    final Widget raiseButton = Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Theme(
        data: Theme.of(context).copyWith(
          buttonColor: Theme.of(context).accentColor,
          buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(50)
              // ),
              shape: StadiumBorder()),
        ),
        child: RaisedButton(
            onPressed: () {},
            child: Text("Button"),
            splashColor: Colors.grey[100].withOpacity(0.5),
            elevation: 0.0,
            //   textColor: Colors.white,
            // textTheme: ButtonTextTheme.primary,
            color: Theme.of(context).accentColor),
      ),
      SizedBox(width: 16.0),
      RaisedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text("Button"),
        splashColor: Colors.grey[100].withOpacity(0.5),
        elevation: 12.0,
      ),
    ]);

    final Widget outLineButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          onPressed: () {},
          child: Text("Button"),
          borderSide: BorderSide(
              color: Colors.red, width: 2.0, style: BorderStyle.solid),
        ),
        SizedBox(
          width: 32.0,
        ),
        OutlineButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("Button"),
          borderSide: BorderSide(
              color: Colors.red, width: 2.0, style: BorderStyle.solid),
        ),
      ],
    );

    final Widget fixwidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 160.0,
          child: OutlineButton(
            onPressed: () {},
            child: Text("Button"),
            borderSide: BorderSide(
                color: Colors.red, width: 2.0, style: BorderStyle.solid),
          ),
        ),
      ],
    );

    final Widget expandButton =  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: OutlineButton(
                    onPressed: () {},
                    child: Text("Button"),
                    borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                        style: BorderStyle.solid),
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  flex: 2,
                  child: OutlineButton(
                    onPressed: () {},
                    child: Text("Button"),
                    borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                        style: BorderStyle.solid),
                  ),
                ),
              ],
            );
    
    final Widget buttonBarButton  = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                    buttonBarTheme: ButtonBarThemeData(
                      buttonPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ), 
                child: ButtonBar(
                //  buttonPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  children: <Widget>[
                    OutlineButton(
                    onPressed: () {},
                    child: Text("Button"),
                    textColor: Colors.black,
                    borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                        style: BorderStyle.solid),
                  ),
                   OutlineButton(
                    onPressed: () {},
                     textColor: Colors.black,
                    child: Text("Button"),
                    borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                        style: BorderStyle.solid),
                  ),
                  ],
                ),
                ),
              ],
            );
   
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           flatButton,
           raiseButton,
           outLineButton,
           fixwidthButton,
           expandButton,
           buttonBarButton
          ],
        ),
      ),
    );
  }
}