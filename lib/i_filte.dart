// class interfact to be implemented by leaf and composite components

import 'package:flutter/material.dart';

abstract interface class IFile {
  int getSize();
  Widget render(BuildContext context);
}
