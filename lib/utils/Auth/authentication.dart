import 'package:local_auth/local_auth.dart';

class Authentification {
  static final LocalAuthentication _auth = LocalAuthentication();

  /// Vérifie si l'appareil prend en charge l'authentification biométrique.
  static Future<bool> canAuthentifier() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  /// Effectue l'authentification biométrique.
  static Future<bool> authentifier() async {
    try {
      if (!await canAuthentifier()) return false;
      return await _auth.authenticate(
          localizedReason: 'Authentifiez-vous pour accéder à l\'application',
          );
    } catch (e) {
      print('Erreur lors de l\'authentification : $e');
      return false;
    }
  }
}
