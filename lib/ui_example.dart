import 'package:flutter/material.dart';
import 'package:flutter_design_pattern/example_state_implement.dart';

import 'example_state_base.dart';

class SingletonExample extends StatefulWidget {
  const SingletonExample({super.key});

  @override
  State<SingletonExample> createState() => _SingletonExampleState();
}

class _SingletonExampleState extends State<SingletonExample> {
  final List<ExampleStateBase> stateList = [
    ExampleState(),
    ExampleStateWithOutSingleton(),
    ExampleStateByDefinition.getState(),
  ];

  void _setTextValue([String text = 'SingleTon']) {
    for (final state in stateList) {
      state.setStateText(text);
    }
  }

  void _reset() {
    for (final state in stateList) {
      state.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            children: [
              for (final state in stateList)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(state.currentText),
                ),
              GestureDetector(
                onTap: _reset,
                child: const Text('reset'),
              ),
              GestureDetector(
                onTap: _setTextValue,
                child: const Text('Change state'),
              )
            ],
          ),
        ));
  }
}
