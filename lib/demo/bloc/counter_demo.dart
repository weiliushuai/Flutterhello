import 'package:flutter/material.dart';
import 'dart:async';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterbloc = CounterProvider.of(context).bloc;
    return Center(
      child: StreamBuilder(
          initialData: 0,
          stream: _counterbloc.count,
          builder: (context, snapshot) {
            return ActionChip(
              label: Text("${snapshot.data}"),
              onPressed: () {
                //  _counterbloc.log();
                _counterbloc.counter.add(1);
              },
            );
          },
          ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterbloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //   _counterbloc.log();
          _counterbloc.counter.add(1);
        });
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({Key key, this.child, this.bloc})
      : super(key: key, child: child);

  final Widget child;
  final CounterBloc bloc;

  static CounterProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CounterProvider>());
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;

  final _counterActionCountroll = StreamController<int>();

  final _countCountroll = StreamController<int>();

  StreamSink<int> get counter => _counterActionCountroll.sink;

  Stream<int> get count => _countCountroll.stream;

  CounterBloc() {
    _counterActionCountroll.stream.listen(onData);
  }

  void onData(int data) {
    print("$data");

    _count = data + _count;
    _countCountroll.add(_count);
  }

  void dispose() {
    _counterActionCountroll.close();
    _countCountroll.close();
  }

  void log() {
    print("Bloc");
  }
}
