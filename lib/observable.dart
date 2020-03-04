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
class Observable<T> {
  T _property;

  T get property => _property;

  set property(T newValue) {
    _property = newValue;
    for (var callback in _callbacks) {
      callback?.action();
    }
  }

  Observable(this._property);

  Set<ObservableCallback> _callbacks = Set<ObservableCallback>();

  void dispose() {
    _callbacks?.clear();
    property = null;
  }

  Observable<T> addCallback(ObservableCallback callback) {
    _callbacks.add(callback);
    return this;
  }
}

class ObservableCallback {
  Function action;

  ObservableCallback(this.action);
}
