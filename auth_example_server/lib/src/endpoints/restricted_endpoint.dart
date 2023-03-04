import 'package:auth_example_server/server.dart';
import 'package:serverpod/serverpod.dart';

class RestrictedEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {Scopes.someScope};

  Future<String> superSecret(Session session) async {
    return 'someSecret';
  }
}
