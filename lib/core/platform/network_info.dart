import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    final connectivityStatus = await Connectivity().checkConnectivity();
    return connectivityStatus != ConnectivityResult.none;
  }
}
