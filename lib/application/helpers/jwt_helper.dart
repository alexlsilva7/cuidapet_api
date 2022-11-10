import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:dotenv/dotenv.dart';

class JwtHelper {
  JwtHelper._();

  static final env = DotEnv(includePlatformEnvironment: true)..load();
  static final String _secret = env['JWT_SECRET'] ?? env['jwtSecret']!;

  static JwtClaim getClaims(String token) {
    return verifyJwtHS256Signature(token, _secret);
  }
}
