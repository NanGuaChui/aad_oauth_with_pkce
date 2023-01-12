import '../model/config.dart';

class TokenRequestDetails {
  String? url;
  Map<String, String?>? params;
  Map<String, String>? headers;

  TokenRequestDetails(Config config, String? code) {
    url = config.tokenUrl;
    params = {
      'client_id': config.clientId,
      'code': code,
      'redirect_uri': config.redirectUri,
      'code_verifier': config.codeVerifier!,
      'grant_type': 'authorization_code',
    };

    if (config.resource != null) {
      params!.putIfAbsent('resource', () => config.resource);
    }

    if (config.clientSecret != null) {
      params!.putIfAbsent('client_secret', () => config.clientSecret);
    }

    headers = {
      'Accept': 'application/json',
      'Content-Type': config.contentType,
      'Origin': config.redirectUri,
    };
  }
}
