/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'dart:io' as _i3;
import 'protocol.dart' as _i4;

class _EndpointAuth extends _i1.EndpointRef {
  _EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  _i2.Future<String?> signInWithApiKey(String apiKey) =>
      caller.callServerEndpoint<String?>(
        'auth',
        'signInWithApiKey',
        {'apiKey': apiKey},
      );
}

class _EndpointRestricted extends _i1.EndpointRef {
  _EndpointRestricted(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'restricted';

  _i2.Future<String> superSecret() => caller.callServerEndpoint<String>(
        'restricted',
        'superSecret',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i3.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i4.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    auth = _EndpointAuth(this);
    restricted = _EndpointRestricted(this);
  }

  late final _EndpointAuth auth;

  late final _EndpointRestricted restricted;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'auth': auth,
        'restricted': restricted,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
