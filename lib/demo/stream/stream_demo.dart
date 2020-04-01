
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

  StreamController<String> _streamDemo;

  StreamSink _sinkDemo;

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print("Creat a Stream");
     _streamDemo = StreamController.broadcast();

     _sinkDemo = _streamDemo.sink;
    print("Start a listning...");
    _streamSubscription = _streamDemo.stream.listen(onData,onError: onError,onDone: onDone);
                          _streamDemo.stream.listen(onDataTwo,onError: onError,onDone: onDone);

    print("InitState complete");
  }

  void _addStream() async{
     print("add stream");
    String data = await fetchData();
   // _streamDemo.add(data);
   _sinkDemo.add(data);
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

   void onDataTwo(String data){
    print("Stream Two Data : $data");
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
              child: Text("add"),
              onPressed: _addStream,
            ),
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