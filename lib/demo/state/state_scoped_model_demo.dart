import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("StateManagementDemo"),
          elevation: 0.0,
        ),
        body: CountWrapp(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context, _, model) => FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: model._increaseCoun,
                )),
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
    return ScopedModelDescendant<CounterModel>(
        builder: (context, _, model) => ActionChip(
              label: Text("${model.count}"),
              onPressed: model._increaseCoun,
            ));
  }
}

class CounterModel extends Model {
  int count = 0;

  int get Count => count;

  void _increaseCoun() {
    count += 1;
    notifyListeners();
  }
}
