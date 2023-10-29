import 'package:flutter/material.dart';
import 'package:flutter_design_pattern/i_filte.dart';

class Directory extends StatelessWidget implements IFile {
  Directory({super.key, required this.title, this.isInitiallyExpanded = false});

  final String title;
  final bool isInitiallyExpanded;

  final List<IFile> files = [];

  void addFile(IFile file) => files.add(file);

  @override
  int getSize() {
    int sum = 0;
    for (final file in files) {
      sum += file.getSize();
    }
    return sum;
  }

  @override
  Widget render(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: ExpansionTile(
          leading: const Icon(Icons.folder),
          title: Text('$title '),
          initiallyExpanded: isInitiallyExpanded,
          children: files.map((IFile file) => file.render(context)).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}
