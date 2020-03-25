import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Center(
            //   child: Text("NINGHAO"),
            // ),
          //  pinned: true,//固定在顶部
            floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              
              title:Text(
                "NINGHAO".toUpperCase(),
                style:TextStyle(
                  fontSize:15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400
                ),
              ),
              background: Image.network(
                "https://resources.ninghao.org/images/dragon.jpg",
                fit:BoxFit.cover
              ),
            ),
          ),
          SliverSafeArea(
              sliver: SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverCount(),
          )),
        ],
      ),
    );
  }
}

class SliverListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32.0),
          child: Material(
            
            borderRadius: BorderRadius.circular(22.0),
            elevation: 14.0,
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                      child: Image.network(posts[index].imageUrl,
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 80.0,
                  left: 130.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(posts[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(posts[index].author,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }, childCount: posts.length),
    );
  }
}

class SliverExten extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
          );
        }, childCount: posts.length),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 180.0,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 2, //宽高比
        ));
  }
}

class SliverCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
          );
        }, childCount: posts.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ));
  }
}

class SliverGridExtend extends StatelessWidget {
  List<Widget> _sliverGridCount() {
    return List.generate(posts.length, (int index) {
      return Container(
        child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverGrid.extent(
          maxCrossAxisExtent: 120.0,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: _sliverGridCount(),
        ),
      ]),
    );
  }
}

class SliverGridCount extends StatelessWidget {
  List<Widget> _sliverGridCount() {
    return List.generate(posts.length, (int index) {
      return Container(
        child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: _sliverGridCount(),
        ),
      ]),
    );
  }
}
