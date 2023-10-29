import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ParentClass extends StatelessWidget {
  const ParentClass({super.key});

  void call() {
    if (kDebugMode) {
      print('call from parent class');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const ChildClass();
  }
}

class ChildClass extends StatelessWidget {
  const ChildClass({super.key});

  void call() {
    if (kDebugMode) {
      print('call from parent class');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton.outlined(
          onPressed: () {
            context.findAncestorWidgetOfExactType<ParentClass>()!.call();
          },
          icon: const Icon(Icons.add)),
    );
  }
}
