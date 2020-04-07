import 'package:flutter/material.dart';
import "./demo/listview_demo.dart";
import "./demo/hello_demo.dart";
import './demo/drawe_demo.dart';
import './demo/bottomnavigation_demo.dart';
import './demo/basic_demo.dart';
import './demo/layout_demo.dart';
import './demo/view_demo.dart';
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';
import './demo/form_demo.dart';
import './demo/material_components.dart';
import './demo/state/state_management_demo.dart';
import './demo/state/state_scoped_model_demo.dart';
import './demo/stream/stream_demo.dart';
import './demo/rxdart/rxdart_demo.dart';
import 'demo/animation/animation_demo.dart';
import 'demo/bloc/bloc_demo.dart';
import 'demo/http/http_demo.dart';

void main()=> runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    //  home:Home(),
     initialRoute: "/animation",
      routes: {
        "/":(context) => NavigatorDemo(),
        "/about": (context) => PageDemo(title:"Anout"),
        "/form" : (context) => FortDemo(),
        "/mdc" : (context) => MaterialComponents(),
        "/state" : (context) => StateManagementDemo(),
        "/scoped" : (context) => StateManagementDemo1(),
        "/stream" : (context) => StreamDemo(),
        "/rxdart" : (context) => RxDartDemo(),
        "/bloc" : (context) => BlocDemo(),
        "/http" : (context) => HttpDemo(),
        "/animation" : (context) => AnimationDemo(),




      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255,255, 0.5),
        splashColor: Colors.white54,
        accentColor: Colors.blue

      ),
  
    );
  
  }
}
class Home extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
      backgroundColor: Colors.grey[100],
        appBar:AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu), 
          //   tooltip: "Navigation",
          //   onPressed: ()=>debugPrint("Navigation button is press")
          // ),
          title:Text( "NINGHAO"),
          centerTitle: true,
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,//未选中的颜色
            indicatorColor: Colors.black,//指示器的颜色
            indicatorSize: TabBarIndicatorSize.label,//指示器的样式
            indicatorWeight: 1.0,//指示器的高度
            tabs: <Widget>[
              Tab(icon:Icon(Icons.local_florist)),
              Tab(icon:Icon(Icons.change_history)),
              Tab(icon:Icon(Icons.directions_bike)),
               Tab(icon:Icon(Icons.view_list)),
            ]
            ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search", 
              onPressed: ()=>debugPrint("Search button is press")
              )
          ],

        ),
        body: TabBarView(
          children: <Widget>[
          
            ListView_demo(),
            BasicDemo(),
            LayoutDemo(),
            SliverDemo()
          //  ViewDemo()

          ]
          ),
        drawer:DrawerDemo(),
        bottomNavigationBar:BottonNavigationBarDemo()
      ),
      );
  }
}