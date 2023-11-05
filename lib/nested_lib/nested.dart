import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Nested extends StatelessWidget implements SingleChildWidget {
  Nested({
    Key? key,
    required List<SingleChildWidget> children,
    Widget? child,
  })  : assert(children.isNotEmpty),
        _children = children,
        _child = child,
        super(key: key);

  final List<SingleChildWidget> _children;
  final Widget? _child;

  @override
  Widget build(BuildContext context) {
    throw StateError('implemented internally');
  }

  @override
  _NestedElement createElement() => _NestedElement(this);
}

class _NestedElement extends StatelessElement
    with SingleChildWidgetElementMixin {
  _NestedElement(Nested widget) : super(widget);

  @override
  Nested get widget => super.widget as Nested;

  final nodes = <_NestedHookElement>{};

  @override
  Widget build() {
    _NestedHook? nestedHook;
    var nextNode = _parent?.injectedChild ?? widget._child;

    for (final child in widget._children.reversed) {
      nextNode = nestedHook = _NestedHook(
        owner: this,
        wrappedWidget: child,
        injectedChild: nextNode,
      );
    }

    if (nestedHook != null) {
      for (final node in nodes) {
        node
          ..wrappedChild = nestedHook!.wrappedWidget
          ..injectedChild = nestedHook.injectedChild;

        final next = nestedHook.injectedChild;
        if (next is _NestedHook) {
          nestedHook = next;
        } else {
          break;
        }
      }
    }

    return nextNode!;
  }
}

class _NestedHook extends StatelessWidget {
  const _NestedHook({
    this.injectedChild,
    required this.wrappedWidget,
    required this.owner,
  });

  final SingleChildWidget wrappedWidget;
  final Widget? injectedChild;
  final _NestedElement owner;

  @override
  _NestedHookElement createElement() => _NestedHookElement(this);

  @override
  Widget build(BuildContext context) => throw StateError('handled internally');
}

class _NestedHookElement extends StatelessElement {
  _NestedHookElement(_NestedHook widget) : super(widget);

  @override
  _NestedHook get widget => super.widget as _NestedHook;

  Widget? _injectedChild;
  Widget? get injectedChild => _injectedChild;
  set injectedChild(Widget? value) {
    final previous = _injectedChild;
    if (value is _NestedHook &&
        previous is _NestedHook &&
        Widget.canUpdate(value.wrappedWidget, previous.wrappedWidget)) {
      return;
    }
    if (previous != value) {
      _injectedChild = value;
      visitChildren((e) => e.markNeedsBuild());
    }
  }

  SingleChildWidget? _wrappedChild;
  SingleChildWidget? get wrappedChild => _wrappedChild;
  set wrappedChild(SingleChildWidget? value) {
    if (_wrappedChild != value) {
      _wrappedChild = value;
      markNeedsBuild();
    }
  }

  @override
  void mount(Element? parent, dynamic newSlot) {
    widget.owner.nodes.add(this);
    _wrappedChild = widget.wrappedWidget;
    _injectedChild = widget.injectedChild;
    super.mount(parent, newSlot);
  }

  @override
  void unmount() {
    widget.owner.nodes.remove(this);
    super.unmount();
  }

  @override
  Widget build() {
    return wrappedChild!;
  }
}

abstract class SingleChildWidget implements Widget {
  @override
  SingleChildWidgetElementMixin createElement();
}

mixin SingleChildWidgetElementMixin on Element {
  _NestedHookElement? _parent;

  @override
  void mount(Element? parent, dynamic newSlot) {
    if (parent is _NestedHookElement?) {
      _parent = parent;
    }
    super.mount(parent, newSlot);
  }

  @override
  void activate() {
    super.activate();
    visitAncestorElements((parent) {
      if (parent is _NestedHookElement) {
        _parent = parent;
      }
      return false;
    });
  }
}

abstract class SingleChildStatelessWidget extends StatelessWidget
    implements SingleChildWidget {
  const SingleChildStatelessWidget({Key? key, Widget? child})
      : _child = child,
        super(key: key);

  final Widget? _child;

  Widget buildWithChild(BuildContext context, Widget? child);

  @override
  Widget build(BuildContext context) => buildWithChild(context, _child);

  @override
  SingleChildStatelessElement createElement() {
    return SingleChildStatelessElement(this);
  }
}

class SingleChildStatelessElement extends StatelessElement
    with SingleChildWidgetElementMixin {
  SingleChildStatelessElement(SingleChildStatelessWidget widget)
      : super(widget);

  @override
  Widget build() {
    if (_parent != null) {
      return widget.buildWithChild(this, _parent!.injectedChild);
    }
    return super.build();
  }

  @override
  SingleChildStatelessWidget get widget =>
      super.widget as SingleChildStatelessWidget;
}

abstract class SingleChildStatefulWidget extends StatefulWidget
    implements SingleChildWidget {
  const SingleChildStatefulWidget({Key? key, Widget? child})
      : _child = child,
        super(key: key);

  final Widget? _child;

  @override
  SingleChildStatefulElement createElement() {
    return SingleChildStatefulElement(this);
  }
}

abstract class SingleChildState<T extends SingleChildStatefulWidget>
    extends State<T> {
  Widget buildWithChild(BuildContext context, Widget? child);

  @override
  Widget build(BuildContext context) => buildWithChild(context, widget._child);
}

class SingleChildStatefulElement extends StatefulElement
    with SingleChildWidgetElementMixin {
  SingleChildStatefulElement(SingleChildStatefulWidget widget) : super(widget);

  @override
  SingleChildStatefulWidget get widget =>
      super.widget as SingleChildStatefulWidget;

  @override
  SingleChildState<SingleChildStatefulWidget> get state =>
      super.state as SingleChildState<SingleChildStatefulWidget>;

  @override
  Widget build() {
    if (_parent != null) {
      return state.buildWithChild(this, _parent!.injectedChild!);
    }
    return super.build();
  }
}

class SingleChildBuilder extends SingleChildStatelessWidget {
  const SingleChildBuilder({Key? key, required this.builder, Widget? child})
      : super(key: key, child: child);

  final Widget Function(BuildContext context, Widget? child) builder;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return builder(context, child);
  }
}

mixin SingleChildStatelessWidgetMixin
    implements StatelessWidget, SingleChildStatelessWidget {
  Widget? get child;

  @override
  Widget? get _child => child;

  @override
  SingleChildStatelessElement createElement() {
    return SingleChildStatelessElement(this);
  }

  @override
  Widget build(BuildContext context) {
    return buildWithChild(context, child);
  }
}

mixin SingleChildStatefulWidgetMixin on StatefulWidget
    implements SingleChildWidget {
  Widget? get child;

  @override
  _SingleChildStatefulMixinElement createElement() =>
      _SingleChildStatefulMixinElement(this);
}

mixin SingleChildStateMixin<T extends StatefulWidget> on State<T> {
  Widget buildWithChild(BuildContext context, Widget child);

  @override
  Widget build(BuildContext context) {
    return buildWithChild(
      context,
      (widget as SingleChildStatefulWidgetMixin).child!,
    );
  }
}

class _SingleChildStatefulMixinElement extends StatefulElement
    with SingleChildWidgetElementMixin {
  _SingleChildStatefulMixinElement(SingleChildStatefulWidgetMixin widget)
      : super(widget);

  @override
  SingleChildStatefulWidgetMixin get widget =>
      super.widget as SingleChildStatefulWidgetMixin;

  @override
  SingleChildStateMixin<StatefulWidget> get state =>
      super.state as SingleChildStateMixin<StatefulWidget>;

  @override
  Widget build() {
    if (_parent != null) {
      return state.buildWithChild(this, _parent!.injectedChild!);
    }
    return super.build();
  }
}

mixin SingleChildInheritedElementMixin
    on InheritedElement, SingleChildWidgetElementMixin {
  @override
  Widget build() {
    if (_parent != null) {
      return _parent!.injectedChild!;
    }
    return super.build();
  }
}
