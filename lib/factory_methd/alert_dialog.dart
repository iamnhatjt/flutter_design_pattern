import 'package:flutter/material.dart';
import 'package:flutter_design_pattern/factory_methd/custom_dialog.dart';

class AndroidDialog extends CustomDialog {
  AndroidDialog();
  @override
  String getTitle() => "This is android dialog";

  @override
  Widget create(BuildContext context) {
    return AlertDialog(
      title: Text(getTitle()),
      content: const Text("This is android dialog!..."),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("close"))
      ],
    );
  }
}
