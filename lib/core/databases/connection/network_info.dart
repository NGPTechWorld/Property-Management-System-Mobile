//!data_connection_checker_tv

import 'package:connectivity_plus/connectivity_plus.dart';

//!===================================================================!//
//!                      don't edit this file                         !//
//!===================================================================!//

abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoConnectivity implements NetworkInfo {
  final Connectivity connectionChecker;

  NetworkInfoConnectivity(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    final result = await connectionChecker.checkConnectivity();

    if (result.contains(ConnectivityResult.none)) {
      return false;
    } else {
      return true;
    }
  }
}
