import 'package:flutter/material.dart';
import 'package:flutter_design_pattern/i_filte.dart';

base class File extends StatelessWidget implements IFile {
  const File(
      {super.key, required this.title, required this.size, required this.icon});

  final String title;
  final int size;
  final IconData icon;

  @override
  int getSize() => size;

  @override
  Widget render(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: Icon(icon),
        trailing: Text(
          '',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.black54),
        ),
        dense: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}
