import 'package:flutter/material.dart';
class BottonNavigationBarDemo extends StatefulWidget{
   @override
  State<StatefulWidget> createState() {
   
    return _BottomNavigationDemo();
  }
}
class _BottomNavigationDemo extends State<BottonNavigationBarDemo>{
   int _currentIndex = 0;
   void _onTapHandler(int index){
     setState(() {
       _currentIndex = index;
     });
   }
    @override
    Widget build(BuildContext context) {
      return  BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: _onTapHandler,
          items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页")     
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text("记录")     
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text("扩展")     
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("我的")     
              ),
          ] 
          );
    }

}