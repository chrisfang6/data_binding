import 'package:data_binding/command.dart';
import 'package:data_binding/observable.dart';

abstract class BaseViewModel extends CommandReceiver {
  Set<Observable> _observables;

  BaseViewModel() {
    _initObservables(getObservables());
  }

  void dispose() => _removeAllObservables();

  Set<Observable> getObservables();

  _initObservables(Set<Observable> observables) {
    _observables = observables ?? Set<Observable>();
  }

  _removeAllObservables() {
    for (Observable observable in _observables) {
      observable?.dispose();
    }
    _observables?.clear();
  }
}
