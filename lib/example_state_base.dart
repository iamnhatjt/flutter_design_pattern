import 'package:flutter/material.dart';

base class ExampleStateBase {
  @protected
  late String initialText;

  @protected
  late String stateText;

  String get currentText => stateText;

  void setStateText(String text) {
    stateText = text;
  }

  void reset() {
    stateText = initialText;
  }
}
