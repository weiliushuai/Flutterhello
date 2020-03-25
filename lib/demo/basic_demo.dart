import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   
    return ContainDemo();
  }
}

class ContainDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
    //  color: Colors.grey[100],
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://resources.ninghao.org/images/candy-shop.jpg"),
          alignment: Alignment.topCenter,
          //repeat: ImageRepeat.repeatY,//重复
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(//滤镜
            Colors.indigoAccent[400].withOpacity(0.5),
            BlendMode.lighten
          ),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         Container(
           
           child: Icon(Icons.pool,color: Colors.white,),
        //   color: Color.fromRGBO(3, 54, 255, 1),
           padding: EdgeInsets.all(22.0), 
           margin: EdgeInsets.all(8.0),
           width: 100.0,
           height: 100.0,
           decoration: BoxDecoration(
             color: Color.fromRGBO(3, 54, 255, 1),
             border: Border.all(
                 color: Colors.red,
                 width: 3.0,
                 style: BorderStyle.solid,  
             ),
             shape: BoxShape.circle,
             // borderRadius:BorderRadius.circular(12.0),//圆角和圆形不能一起设置
             boxShadow: [
                BoxShadow(
                  offset: Offset(12.0, 18.0),
                  blurRadius: 12.0,
                  spreadRadius: -5.0
                ),
              
              ],
             gradient: LinearGradient(//渐变色
               colors: [
                 Color.fromRGBO(0, 7, 255, 1.0),
                 Color.fromRGBO(200, 54, 79, 1.0),
               ],
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter
               ),
           ),
         ),
       ], 
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text:TextSpan(
        text: "ninghao",
        style: TextStyle(
          fontSize: 33.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic
        ),
        children: [
          TextSpan(
            text: ".net",
            style: TextStyle(
              color: Colors.red,
              fontSize: 18.0
            ),
          ),
        ]
      ) );
  }
}

class TextDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     final String _author = "陆游";
    final String _title = "钗头凤";
    return Text(
      "《$_author》--- $_title 红酥手，黄縢酒，满城春色宫墙柳。东风恶，欢情薄。一怀愁绪，几年离索。错、错、错。春如旧，人空瘦，泪痕红浥鲛绡透。桃花落，闲池阁。山盟虽在，锦书难托。莫、莫、莫！",
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 22.0,
        )
      );
  }
}