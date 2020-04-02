import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatelessWidget {
  const RxDartDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("RxDartDemo")),
      body:RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  RxDartDemoHome({Key key}) : super(key: key);

  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  @override
  void initState() {
    super.initState();
//     Observable<String> _observable =  
//     // Observable(Stream.fromIterable(["hello","你好"]));
//    // Observable.fromFuture(Future.value("hello~"));
// //  Observable.fromIterable(["nihao","nihao~~"]);
//   Observable.periodic(Duration(seconds:1),(x) => x.toString());

//     _observable.listen(print);

//  PublishSubject _subject = PublishSubject<String>();
  BehaviorSubject _subject = BehaviorSubject<String>();

  _subject.add("hello");
    _subject.add("hola");
  _subject.listen((data) => print("Listen 1 : $data"));

  _subject.listen((data) => print("Listen 2 :${data.toUpperCase()}"));


  _subject.close();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}