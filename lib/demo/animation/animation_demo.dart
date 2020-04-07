import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimationDemo")),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;
  @override
  void initState() {
    super.initState();
    animationDemoController =
        AnimationController(
          // value: 12,//初始值
          // lowerBound: 32.0,//默认最小值
          // upperBound: 100.0,//最大值
          duration: Duration(seconds: 1), 
          vsync: this
          );

    animationDemoController.addListener(() {
    //  print("${animationDemoController.value}");
    setState(() {
      
    });
    });


  //  animationDemoController.forward();//开始播放动画
  curve = CurvedAnimation(parent: animationDemoController,curve: Curves.easeInCirc);

  animation = Tween(begin: 32.0,end: 100.0).animate(curve);
  animationColor = ColorTween(begin: Colors.red,end: Colors.red[900]).animate(curve);
  }

  @override
  void dispose() {
    super.dispose();
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimationHart(
          animations: [
            animation,
            animationColor
          ],
          controller: animationDemoController,
      ),
    );
  }
}

class AnimationHart extends AnimatedWidget{
  final List animations;
  final AnimationController controller;

  AnimationHart({
    this.animations,
    this.controller,
  }):super(listenable:controller);

  @override
  Widget build(BuildContext context) {

    return Center(
        child: IconButton(
          icon: Icon(Icons.favorite,),
          iconSize: animations[0].value,
          color: animations[1].value,
          onPressed: (){
            switch (controller.status) {
              case AnimationStatus.completed:
                controller.reverse();
                break;
              default:
              controller.forward();
            }
          }
          ),
      );
  }
}