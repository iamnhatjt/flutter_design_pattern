// import 'package:flutter/material.dart';
// import 'package:nested/nested.dart';

// base class SomethingWidget extends StatelessWidget {
//   const SomethingWidget({super.key, required this.child});
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return child;
//   }
// }

// // before

// final class MyWidgetBefore extends StatelessWidget {
//   const MyWidgetBefore({super.key, required this.child});
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return SomethingWidget(
//       child: child,
//     );
//   }
// }

// // after

// class MyWidgetAfter extends SingleChildStatelessWidget {
//   const MyWidgetAfter({super.key, super.child});

//   @override
//   Widget buildWithChild(BuildContext context, Widget? child) {
//     return SomethingWidget(child: child ?? const SizedBox.shrink());
//   }
// }

// class ImplementWidget extends StatelessWidget {
//   const ImplementWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Nested(
//       children: const [MyWidgetAfter()],
//       child: const Text('leaf'),
//     );
//   }
// }
