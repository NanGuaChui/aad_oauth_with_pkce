import 'package:aad_oauth_with_pkce/model/config.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aad_oauth_with_pkce/aad_oauth_with_pkce.dart';

void main() {
  test('adds one to input values', () {
    final Config config = Config(
        azureTenantId: 'YOUR TENANT ID',
        clientId: 'YOUR CLIENT ID',
        scope: 'openid profile offline_access',
        redirectUri: 'redirectUri',
        responseType: 'code');
    final AadOauthWithPKCE oauth = AadOauthWithPKCE(config);
    oauth.toString();
  });
}
