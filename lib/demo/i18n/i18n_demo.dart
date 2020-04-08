

import 'package:flutter/material.dart';

class I18nDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Scaffold(
     appBar: AppBar(title: Text("I18nDemo"),), 
     body: Center(
       child: Text(locale.toString()),
     ),
    );
  }
}

class I18nDemoHome extends StatefulWidget {


  @override
  _I18nDemoHomeState createState() => _I18nDemoHomeState();
}

class _I18nDemoHomeState extends State<I18nDemoHome> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}