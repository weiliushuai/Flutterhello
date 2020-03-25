import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GirdViewBuilderDemo();
  }
}

class GirdViewBuilderDemo extends StatelessWidget {
  Widget _gridViewBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: posts.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 110.0,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0),
        itemBuilder: _gridViewBuilder);
  }
}

class GridViewExtendDemo extends StatelessWidget {
  List<Widget> _itemBuildCount(int length) {
    return List.generate(
      length,
      (int index) {
        return Container(
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
      maxCrossAxisExtent: 130.0,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: _itemBuildCount(posts.length),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _itemBuildCount(int length) {
    return List.generate(
      length,
      (int index) {
        return Container(
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: _itemBuildCount(posts.length),
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _itemBuilderWidget(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].author,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          bottom: 10.0,
          left: 10.0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
        itemCount: posts.length, itemBuilder: _itemBuilderWidget);
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      //  pageSnapping: false,//可以滚动到页面任意位置
      //  reverse: true,//倒置页面顺序
      //  scrollDirection: Axis.vertical,//页面滚动方向，默认为水平方向
      onPageChanged: (currentPage) => debugPrint("page:$currentPage"),
      controller: PageController(
        keepPage: false, //是否记录之前滚动的位置，默认是true
        initialPage: 2, //初始是哪个页面
        viewportFraction: 0.9, //占据整个视图的百分比，默认是1.0
      ),
      children: <Widget>[
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0), //居中
          child: Text(
            "ONE",
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          color: Colors.blue[900],
          alignment: Alignment(0.0, 0.0), //居中
          child: Text(
            "TWO",
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          color: Colors.red[900],
          alignment: Alignment(0.0, 0.0), //居中
          child: Text(
            "THREE",
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
      ],
    );
  }
}
