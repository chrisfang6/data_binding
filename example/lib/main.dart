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
