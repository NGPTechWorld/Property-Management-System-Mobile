import 'dart:developer';

import 'package:bloc/bloc.dart';

//!===================================================================
//!                      don't edit this file
//!===================================================================


mixin CubitProviderMixin {
  final Map<Type, Cubit> _cubits = {};

  late final Cubit cubit;

  T getCubit<T extends Cubit<Object>>(T Function() create) {
    final type = T;
    log("get cubit method");
    log("is cubit found: ${_cubits.containsKey(type).toString()}");
    log("is cubit closed: ${(_cubits[type] as T?)?.isClosed.toString()}");
    if (!_cubits.containsKey(type) || (_cubits[type] as T).isClosed) {
      log("cubit is closed or not found");
      _cubits[type] = create();

      // Automatically clean up when stream is done
      (_cubits[type] as T).stream.listen(
        (_) {},
        onDone: () {
          _cubits.remove(type);
        },
      );
    }

    return _cubits[type] as T;
  }

  void closeCubit<T extends Cubit<Object>>() {
    final cubit = _cubits[T];
    if (cubit != null && !cubit.isClosed) {
      cubit.close();
      _cubits.remove(T);
    }
  }

  void closeAllCubits() {
    for (var cubit in _cubits.values) {
      if (!cubit.isClosed) {
        cubit.close();
      }
    }
    _cubits.clear();
  }
}
