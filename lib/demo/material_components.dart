import 'package:flutter/material.dart';
import './button_demo.dart';
import './float_action_button.dart';
import './popup_menu_button_demo.dart';
import './form_demo.dart';
import './check_box_demo.dart';
import './radio_demo.dart';
import './switch_demo.dart';
import './slider_demo.dart';
import './date_time_demo.dart';
import './simple_dialog_demo.dart';
import './alerdialog_demo.dart';
import './bottom_sheet_demo.dart';
import './snacbar_demo.dart';
import './expamsion_pannal_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MaterialComponents"),
      ),
      body: ListView(children: <Widget>[

          Button(
          title: "ExpansionPannalDemo",
          page: ExpansionPannalDemo(),
        ),
        Button(
          title: "SncakBarDemo",
          page: SnackBarDemo(),
        ),
        Button(
          title: "BottomSheetDemo",
          page: BottonSheetDemo(),
        ),
        Button(
          title: "AlerDialogDemo",
          page: AlerDialogDemo(),
        ),
        Button(
          title: "SimpleDialogDemo",
          page: SimpleDialogDemo(),
        ),
        Button(
          title: "DateTimeDemo",
          page: DateTimeDemo(),
        ),
        Button(
          title: "SliderDemo",
          page: SliderDemo(),
        ),
        Button(
          title: "SwitchDemo",
          page: SwitchDemo(),
        ),
        Button(
          title: "RadioDemo",
          page: RadioDemo(),
        ),
        Button(
          title: "CheckboxDemo",
          page: CheckBoxDemo(),
        ),
        Button(
          title: "FormDemo",
          page: FortDemo(),
        ),
        Button(
          title: "PopupMenuButtonDemo",
          page: PopupMenuButtonDemo(),
        ),
        Button(
          title: "ButtonDemo",
          page: ButtonDemo(),
        ),
        ListItemDemo(
          title: "FloatActionButton",
          page: FloatActionButtonDemo(),
        ),
      ]),
    );
  }
}

class Button extends StatelessWidget {
  final String title;
  final Widget page;
  Button({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
        });
  }
}

class ListItemDemo extends StatelessWidget {
  final String title;
  final Widget page;
  ListItemDemo({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
        });
  }
}
