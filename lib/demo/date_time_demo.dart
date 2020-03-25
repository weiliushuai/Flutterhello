import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
   DateTime dateTime = DateTime.now();
   TimeOfDay timeOfDay = TimeOfDay(hour: 9,minute: 30);
  _selectDate() async{
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
       
        );
        if(date == null) return;
        setState(() {
          dateTime = date;
        });
  }
  _selectTime() async{
    TimeOfDay time = await showTimePicker(context: context,
     initialTime: TimeOfDay.fromDateTime(dateTime)
    );
    if(time == null) return;
    setState(() {
      timeOfDay = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DateTimeDemo")),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(DateFormat.yMMMd().format(dateTime)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                 InkWell(
                  onTap: _selectTime,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(timeOfDay.format(context)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
