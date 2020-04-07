

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hello/model/post.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

class HttpDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("HttpDemo"),elevation:0.0),
      body:HtmlDemoHome(),
    );
  }
}

class HtmlDemoHome extends StatefulWidget {
 
  @override
  _HtmlDemoHomeState createState() => _HtmlDemoHomeState();
}

class _HtmlDemoHomeState extends State<HtmlDemoHome> {

  @override
  void initState() {
    super.initState();
    fetch().then((value) => print(value));

  //  final post = {
  //    'title': 'hello ~',
  //    'description':'nice to meet you.'
  //  };

  //  print(post["title"]);
  //  print(post["description"]);

  //  final postJson = json.encode(post);//转换成JSON
  //  print(postJson);

  //  final postJsonConvert = json.decode(postJson);//转换成map
  //  print(postJsonConvert);
  //  print(postJsonConvert["title"]);
  //  print(postJsonConvert["description"]);
  //  print(postJsonConvert is Map);

  //   final postModel = Post.fromJson(postJsonConvert);
  //   print("title:${postModel.title},description:${postModel.description}");

  //   print('${json.encode(postModel)}');
  }
  
  Future<List<Post>> fetch() async {
    final response = await get("https://resources.ninghao.net/demo/posts.json");

    if(response.statusCode == 200){
      final resposeBody = json.decode(response.body);
      List<Post> posts = resposeBody['posts']
      .map<Post>((value) => Post.fromJson(value))
      .toList();
      return posts;
    }else{
      throw Exception("Fail to fetch Post!");
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetch(),
      builder: (BuildContext context,AsyncSnapshot snapshot){
        print("${snapshot.data}");
        print("${snapshot.connectionState}");
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Chip(label: Text("loading...")),
          );
        }
        return ListView(
          children: snapshot.data.map<Widget>((item){
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
          );
  
      },
      );
  }
}

class Post{
  final int id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  Post(
    this.title,
    this.description,
    this.id,
    this.author,
    this.imageUrl
  );

  Post.fromJson(Map json)
    : title = json['title'],
    description = json['description'],
    id = json['id'],
    author = json['author'],
    imageUrl = json['imageUrl'];

    Map toJson() =>{
      'title':title,
      'description':description,
      'id':id,
      'author':author,
      'imageUrl':imageUrl
    };
}