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
