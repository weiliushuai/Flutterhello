import 'package:flutter/material.dart';


class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemo createState() => _StateManagementDemo();
}

class _StateManagementDemo extends State<StateManagementDemo> {
  int _count = 0;

  void _inscreatCount() {
    setState(() {
      _count += 1;
      print(_count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increateCount: _inscreatCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text("StateManagementDemo"),
          elevation: 0.0,
        ),
        body: CountWrapp(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _inscreatCount,
        ),
      ),
    );
  }
}

class CountWrapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    int count = CounterProvider.of(context).count;

    VoidCallback _inscreatCount = CounterProvider.of(context).increateCount;
    return ActionChip(
      label: Text("$count"),
      onPressed: _inscreatCount,
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increateCount;
  final Widget child;

  CounterProvider({this.count, this.increateCount, this.child})
      : super(child: child);

  static CounterProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CounterProvider>());
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

