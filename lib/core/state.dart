import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'error/failures.dart';

export 'error/failures.dart';

class State<T, E extends Failure> {
  State._({@required T data, @required E error})
      : assert(!(data != null && error != null)),
        this._data = data,
        this._error = error;

  factory State.success(T data) = SuccessState<T, E>;

  factory State.error(E message) = ErrorState<T, E>;

  T _data;

  E _error;

  bool get hasData => _data != null;

  bool get hasError => _error != null;

  T get data => _data;

  E get error => _error;

  B fold<B>(B Function(T value) success, B Function(Failure failure) error) {
    if (hasError) {
      return error(_error);
    } else {
      return success(_data);
    }
  }
}

class SuccessState<T, E extends Failure> extends State<T, E> {
  SuccessState(this._data) : super._(data: _data, error: null);
  final T _data;

  T get data => _data;
}

class ErrorState<T, E extends Failure> extends State<T, E> {
  ErrorState(this._error) : super._(data: null, error: _error);
  final E _error;

  E get error => _error;
}
