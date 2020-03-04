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
import 'package:data_binding/base_widget.dart';
import 'package:data_binding/command.dart';
import 'package:data_binding/data_binding.dart';
import 'package:flutter/material.dart';
import 'view_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'example for data binding'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _viewModel = ViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            binding(_viewModel.label, LabelWidgetBuilder()),
            binding(_viewModel.clickNumber, NumberWidgetBuilder()),
            binding(_viewModel.clickNumber, NumberWidgetBuilder()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _viewModel.handle(Command(CommandName.INCREASE.toString(), 1));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class LabelWidgetBuilder extends BindingWidgetBuilder<String> {
  @override
  Widget build(String label, {Widget child, BuildContext context}) =>
      Text('$label');
}

class NumberWidgetBuilder extends BindingWidgetBuilder<ClickNumber> {
  @override
  Widget build(ClickNumber clickNumber, {Widget child, BuildContext context}) =>
      Text(
        '${clickNumber.number}',
        style: TextStyle(
          fontSize: 100,
          color: Color(clickNumber.color),
        ),
      );
}
