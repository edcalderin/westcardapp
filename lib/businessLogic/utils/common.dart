import 'package:connectivity/connectivity.dart';

class Common {
  Future<bool> checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi);
  }
}
