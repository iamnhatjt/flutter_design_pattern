import 'package:flutter_design_pattern/example_state_base.dart';

final class ExampleStateByDefinition extends ExampleStateBase {
  //! example state is a singleton which is implement by definition
  static ExampleStateByDefinition? _instance;

  ExampleStateByDefinition._internal() {
    initialText = "A new 'ExampleStateByDefinition' instance has been created";
    stateText = initialText;
  }

  static ExampleStateByDefinition getState() {
    return _instance ??= ExampleStateByDefinition._internal();
  }
}

final class ExampleState extends ExampleStateBase {
  //! a singleton which is implemented using the dart language capabilities.

  static final ExampleState _instance = ExampleState._internal();

  factory ExampleState() {
    return _instance;
  }

  ExampleState._internal() {
    initialText = "A new ExampleState instance has been created";
    stateText = initialText;
  }
}

final class ExampleStateWithOutSingleton extends ExampleStateBase {
  ExampleStateWithOutSingleton() {
    initialText = "Example state with out singleton has been created";
    stateText = initialText;
  }
}
