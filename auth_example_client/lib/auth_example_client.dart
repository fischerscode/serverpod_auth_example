import 'package:serverpod_client/serverpod_client.dart';

export 'src/protocol/protocol.dart';
export 'package:serverpod_client/serverpod_client.dart';

class CustomAuthenticationKeyManager extends AuthenticationKeyManager {
  String? _key;

  @override
  Future<String?> get() async {
    return _key;
  }

  @override
  Future<void> put(String key) async {
    _key = key;
  }

  @override
  Future<void> remove() async {
    _key = null;
  }
}
