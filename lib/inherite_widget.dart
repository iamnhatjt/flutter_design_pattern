import 'package:flutter/material.dart';

class InheritedCounter extends InheritedWidget {
  const InheritedCounter(
      {super.key, required super.child, required this.counter});
  final int counter;

  @override
  bool updateShouldNotify(InheritedCounter oldWidget) {
    return oldWidget.counter != counter;
  }

  static InheritedCounter of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<InheritedCounter>()!;
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedCounter(
        counter: 0,
        child: Scaffold(
          floatingActionButton:
              IconButton(icon: const Icon(Icons.add), onPressed: () {}),
          body: Builder(builder: (context) {
            return Text(InheritedCounter.of(context).counter.toString());
          }),
        ));
  }
}
