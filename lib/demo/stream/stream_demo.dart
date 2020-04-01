import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StreamDemo"),),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
 

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {

  StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    print("Creat a Stream");
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print("Start a listning...");
    _streamSubscription = _streamDemo.listen(onData,onError: onError,onDone: onDone);

    print("InitState complete");
  }

  void _pauseStream(){
    print("pause stream subscription");
    _streamSubscription.pause();
  }

   void _resumeStream(){
    print("resume stream subscription");
    _streamSubscription.resume();
  }
   void _cancelStream(){
    print("cancel stream subscription");
    _streamSubscription.cancel();
  }

  void onError(error){
    print("error:$error");
  }

  void onDone(){
    print("Done!");
  }

  void onData(String data){
    print("$data");
  }

  Future<String> fetchData() async{
    await Future.delayed(Duration(seconds: 3));
    //throw "Somthing error";
    return "hello ~~";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child:  Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children:<Widget>[
            FlatButton(
              child: Text("pause"),
              onPressed: _pauseStream,
            ),
             FlatButton(
              child: Text("resume"),
              onPressed: _resumeStream,
            ),
             FlatButton(
              child: Text("cancel"),
              onPressed: _cancelStream,
            ),
          ],
        ),
        ),
       
    );

  }
}