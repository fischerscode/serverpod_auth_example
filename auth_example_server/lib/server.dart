import 'package:serverpod/serverpod.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// mapping between api keys and users
const apiKeys = {
  "abcd": 1,
  "1234": 1,
  "someKey": 2,
};

void run(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  await pod.start();
}

enum Test { a }

class Scopes {
  Scopes._();

  static const Scope someScope = Scope('someScope');
}
