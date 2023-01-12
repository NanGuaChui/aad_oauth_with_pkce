import 'package:flutter/widgets.dart' show BuildContext;

import '../helper/random_string.dart';
import '../helper/utils.dart';

class Config {
  final String azureTenantId;
  final String clientId;
  final String scope;
  final String responseType;
  final String redirectUri;
  final String? clientSecret;
  final String? resource;
  final String contentType;
  String? codeVerifier;
  String? codeChallenge;
  String? codeChallengeMethod;
  BuildContext? context;
  String? authorizationUrl;
  String? tokenUrl;
  final String nonce;

  ///ResponseType to mobile usually is "code", and web usually is "id_token+token"
  Config(
      {required this.azureTenantId,
      required this.clientId,
      required this.scope,
      required this.redirectUri,
      required this.responseType,
      this.clientSecret,
      this.resource,
      this.contentType = 'application/x-www-form-urlencoded',
      this.context,
      this.nonce = 'nonce_value'}) {
    authorizationUrl = 'https://login.microsoftonline.com/$azureTenantId/oauth2/v2.0/authorize';
    tokenUrl = 'https://login.microsoftonline.com/$azureTenantId/oauth2/v2.0/token';
    codeVerifier = randomAlphaNumeric(44);
    codeChallenge = Utils.generateCodeChallenge(codeVerifier!);
    codeChallengeMethod = 'S256';
  }
}
