import 'package:flutter/cupertino.dart';

abstract class BindingWidget {
  void disposeViewModel();
}

abstract class BindingWidgetBuilder<T> {
  Widget build(T data, {Widget child, BuildContext context});
}
