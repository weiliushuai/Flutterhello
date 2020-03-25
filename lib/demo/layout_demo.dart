import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 120,
              maxWidth: 120,
            ),
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              child: AspectRatioDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      aspectRatio: 16 / 9, //宽高比
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

class StackDemno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(
              child: Container(
                alignment: Alignment(0.8, -0.5),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                ),
                child: Icon(
                  Icons.ac_unit,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              width: 300,
              height: 300,
            ),
            SizedBox(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(3, 54, 255, 1.0),
                      Color.fromRGBO(200, 24, 25, 1.0),
                    ])),
                child: Icon(
                  Icons.ac_unit,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              height: 64.0,
              width: 64,
            ),
            Positioned(
                top: 120,
                right: 30,
                child: Icon(
                  Icons.brightness_2,
                  color: Colors.white,
                )),
            Positioned(
                top: 30,
                right: 120,
                child: Icon(
                  Icons.brightness_2,
                  color: Colors.white,
                )),
            Positioned(
                top: 150,
                right: 60,
                child: Icon(
                  Icons.brightness_2,
                  color: Colors.white,
                )),
          ],
        ),

        // IconBage(Icons.pool,size: 32,),
        //   SizedBox(
        //   height: 32.0,
        // ),
        // IconBage(Icons.pool,size: 32,)
      ],
    );
  }
}

class IconBage extends StatelessWidget {
  final IconData icon;
  final double size;
  IconBage(this.icon, {this.size = 32.0});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Icon(icon, size: size, color: Colors.white),
        width: size + 64,
        height: size + 64,
        color: Color.fromRGBO(3, 54, 255, 1.0));
  }
}
