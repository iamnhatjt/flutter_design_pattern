import 'package:flutter/cupertino.dart';
import 'package:flutter_design_pattern/factory_methd/custom_dialog.dart';

class IosDialog extends CustomDialog {
  IosDialog();

  @override
  String getTitle() {
    return "This is Ios dialog";
  }

  @override
  Widget create(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(getTitle()),
      content: const Text("this is ios dialog"),
      actions: [
        CupertinoButton(
            child: const Text("Close"), onPressed: () => Navigator.pop(context))
      ],
    );
  }
}
