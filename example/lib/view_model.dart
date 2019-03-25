import 'package:data_binding/base_view_model.dart';
import 'package:data_binding/command.dart';
import 'package:data_binding/observable.dart';

class ViewModel extends BaseViewModel {
  static const String label1 = 'You have pushed the button this many times:';
  static const String label2 = 'You have pushed the button this so many times:';

  final clickNumber = Observable<ClickNumber>(ClickNumber());

  final label = Observable<String>(label1);

  @override
  Set<Observable> getObservables() {
    var set = new Set<Observable>();
    set.addAll([clickNumber]);
    return set;
  }

  @override
  CommandReceiver handle(Command command) {
    switch (
        CommandName.values.firstWhere((e) => e.toString() == command.name)) {
      case CommandName.INCREASE:
        int newNumber = clickNumber.property.number + (command.data as int);
        clickNumber.property = ClickNumber.update(
          newNumber,
          (newNumber % 10 == 0 ? 0xffff0000 : 0xff000000),
        );
        if (newNumber % 10 == 0) {
          label.property = label2;
        } else if (newNumber % 10 == 1) {
          label.property = label1;
        }
        break;
      default:
    }
    return this;
  }
}

class ClickNumber {
  int number = 0;
  int color = 0xff000000;

  ClickNumber();

  ClickNumber.update(this.number, this.color);
}

enum CommandName { INCREASE }
