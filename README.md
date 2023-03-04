# Serverpod custom auth example

This unofficial repository shows how to set up custom authentication in [Serverpod](https://github.com/serverpod/serverpod).

## Most relevant:
- [AuthEndpoint](auth_example_server\lib\src\endpoints\auth_endpoint.dart) is used to sign in.
- [RestrictedEndpoint](auth_example_server\lib\src\endpoints\restricted_endpoint.dart) requires authentication.
- [CustomAuthenticationKeyManager](auth_example_client\lib\auth_example_client.dart) stores the received key.

## Usage
```dart
var authManager = CustomAuthenticationKeyManager();
var client = Client('http://localhost:8080/',
          authenticationKeyManager: authManager);

// Get a key
var authRes = await client.auth.signInWithApiKey('abcd');

// Store the key
authManager.put(authRes!);

// Access the restricted endpoint
var result = await client.restricted.superSecret();
```