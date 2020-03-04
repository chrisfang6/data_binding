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
