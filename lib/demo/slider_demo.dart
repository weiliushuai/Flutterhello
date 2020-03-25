import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  SliderDemo({Key key}) : super(key: key);

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItem = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("SliderDemo")
      ),
      body: Container(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                Slider(
                  value: _sliderItem, 
                  onChanged: (value){
                    setState(() {
                      _sliderItem = value;
                    });
                  },
                  activeColor: Colors.green,
                  inactiveColor: Colors.green.withOpacity(0.3),
                  min: 0.0,
                  max: 100.0,
                  divisions: 10,
                  label: "${_sliderItem.toInt()}",
                  
                  ),
              ],
            ),
            SizedBox( height: 16.0,),
            Text("SliderVlue:${_sliderItem}"),
          ],
        ),
      ),
    );
  }
}