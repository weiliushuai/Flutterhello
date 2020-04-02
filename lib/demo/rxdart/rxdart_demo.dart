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

  PublishSubject _textFilderSubject;

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
//  BehaviorSubject _subject = BehaviorSubject<String>();
  // ReplaySubject _subject = ReplaySubject<String>(maxSize: 2);//设置了最大接受数据的个数

  // _subject.add("hello");
  //   _subject.add("hola");
  //   _subject.add("hi");

  // _subject.listen((data) => print("Listen 1 : $data"));

  // _subject.listen((data) => print("Listen 2 :${data.toUpperCase()}"));


  // _subject.close();

  _textFilderSubject = PublishSubject<String>();

  _textFilderSubject
  //.map((item) => "item : $item")
  //.where((item) => item.length > 9)
  .debounceTime(Duration(seconds:1))//间隔多少时间 
  .listen((data) => print("$data"));

  }

  @override
  void dispose() {
    _textFilderSubject.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor:Colors.black
      ),
      child: TextField(
        onChanged: (value){
          setState(() {
            _textFilderSubject.add("input: $value");
          });
        },
        onSubmitted: (value){
          setState(() {
            _textFilderSubject.add("onSubmitted: $value");
          });
        },
        decoration:InputDecoration(
          labelText: "Text",
      
        ),
      ),
    );
  }
}