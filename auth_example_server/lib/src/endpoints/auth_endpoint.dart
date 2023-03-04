import 'package:auth_example_server/server.dart';
import 'package:serverpod/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AuthEndpoint extends Endpoint {
  Future<String?> signInWithApiKey(Session session, String apiKey) async {
    var userId = apiKeys[apiKey];
    if (userId != null) {
      return (await session.auth
              .signInUser(userId, 'apiKey', scopes: {Scopes.someScope}))
          .result;
    } else {
      return null;
    }
  }
}

extension on AuthKey {
  String? get result => id != null && key != null ? '$id:$key' : null;
}
