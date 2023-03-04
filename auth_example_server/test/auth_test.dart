import 'package:auth_example_client/auth_example_client.dart';
import 'package:test/test.dart';

void main() {
  group('Test auth', () {
    test('correct kex', () async {
      var authManager = CustomAuthenticationKeyManager();
      var client = Client('http://localhost:8080/',
          authenticationKeyManager: authManager);

      var authRes = await client.auth.signInWithApiKey('abcd');
      expect(authRes, isNotNull);

      authManager.put(authRes!);

      expect(await authManager.get(), isNotNull);

      var result = await client.restricted.superSecret();

      expect(result, 'someSecret');
    });
    test('wrong key', () async {
      var authManager = CustomAuthenticationKeyManager();
      var client = Client('http://localhost:8080/',
          authenticationKeyManager: authManager);

      var authRes = await client.auth.signInWithApiKey('asdfgjkl');
      expect(authRes, isNull);
    });
  });
}
