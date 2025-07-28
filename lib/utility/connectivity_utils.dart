import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class ConnectivityUtils {
  bool hasInternet = true;
  StreamSubscription? _subscription;
  final StreamController<bool> _onConnectivityChanged = StreamController.broadcast();

  static final instance = ConnectivityUtils._();

  ConnectivityUtils._();

  Stream<bool> get onConnectivityChanged => _onConnectivityChanged.stream;

  void init() {
    Connectivity().checkConnectivity().then(_onConnectivityChange);
    _subscription = Connectivity().onConnectivityChanged.listen(_onConnectivityChange);
  }

  void _onConnectivityChange(List<ConnectivityResult> result) {
    hasInternet = result.isNotEmpty &&
        result.where((element) => element == ConnectivityResult.mobile || element == ConnectivityResult.wifi).isNotEmpty;
    _onConnectivityChanged.add(hasInternet);
  }

  Future<bool> internetAvailable() async {
    try {
      final response = await http.get(Uri.parse('https://google.com')).timeout(const Duration(seconds: 5));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  void dispose() {
    _subscription?.cancel();
    _onConnectivityChanged.close();
  }
}
