/*
 * Copyright 2019 chrisfang6
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
library data_binding;

import 'dart:async';

import 'package:data_binding/base_widget.dart';
import 'package:data_binding/observable.dart';
import 'package:flutter/cupertino.dart';

Type _typeOf<T>() => T;

StatefulWidget binding<T, B extends BindingWidgetBuilder>(
    Observable<T> observable, B widgetBuilder,
    {Widget child, BuildContext context}) {
  var bloc = _BaseBloc<T>();
  observable.addCallback(ObservableCallback(() => bloc._sink.add(observable)));
  return _BlocProvider(
    bloc: bloc,
    child: StreamBuilder<Observable<T>>(
      stream: bloc._stream,
      initialData: observable,
      builder: (BuildContext context, AsyncSnapshot<Observable<T>> snapshot) =>
          widgetBuilder.build(
            snapshot.data.property,
            child: child,
            context: context,
          ),
    ),
  );
}

class _BaseBloc<T> {
  StreamController<Observable<T>> _controller = StreamController();
  StreamSink<Observable<T>> get _sink => _controller.sink;
  Stream<Observable<T>> get _stream => _controller.stream;

  void dispose() => _controller.close();
}

class _BlocProvider<T extends _BaseBloc> extends StatefulWidget {
  final T bloc;
  final Widget child;

  _BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  @override
  _BlocProviderState<_BlocProvider<T>> createState() =>
      _BlocProviderState<_BlocProvider<T>>();

  static T of<T extends _BaseBloc>(BuildContext context) =>
      (context.ancestorWidgetOfExactType(
        _typeOf<_BlocProvider<T>>(),
      ) as _BlocProvider<T>)
          .bloc;
}

class _BlocProviderState<T extends _BlocProvider> extends State<T> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
