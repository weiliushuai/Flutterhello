import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
             UserAccountsDrawerHeader(
               accountName: Text("wls",style: TextStyle(fontWeight: FontWeight.bold)), 
               accountEmail: Text("https://www.baidu.comn"),
               currentAccountPicture: CircleAvatar(
                 backgroundImage: NetworkImage("https://resources.ninghao.org/images/wanghao.jpg"),
               ),
               decoration: BoxDecoration(
                 color:Colors.yellow[400],
                 image:DecorationImage( 
                   image: NetworkImage("https://resources.ninghao.org/images/childhood-in-a-picture.jpg"),
                   fit: BoxFit.cover,
                   colorFilter: ColorFilter.mode(//添加滤镜
                     Colors.yellow[400].withOpacity(0.6), 
                     BlendMode.hardLight
                     )
                   )
               ),
               ),
                ListTile(
                  title: Text("Message",textAlign: TextAlign.right,),
                  trailing: Icon(Icons.message,size: 22.0,),
                  onTap: ()=>Navigator.pop(context)
                ),
                 ListTile(
                  title: Text("Favorite",textAlign: TextAlign.right,),
                  trailing: Icon(Icons.favorite,size: 22.0,),
                  onTap: ()=>Navigator.pop(context)
                ),
                 ListTile(
                  title: Text("Setting",textAlign: TextAlign.right,),
                  trailing: Icon(Icons.settings,size: 22.0,),
                  onTap: ()=>Navigator.pop(context)
                ),
            ],
          )
        );
  }
}