class Observable<T> {
  T _property;

  T get property => _property;

  set property(T newValue) {
    _property = newValue;
    if (callback != null) {
      callback.action();
    }
  }

  Observable(this._property);

  ObservableCallback callback;
}

class ObservableCallback {
  Function action;

  ObservableCallback(this.action);
}
