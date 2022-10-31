import 'package:cuidapet_api/application/config/dabase_connection_configuration.dart';
import 'package:cuidapet_api/application/config/service_locator_config.dart';
import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:cuidapet_api/application/logger/logger.dart';
import 'package:cuidapet_api/application/routes/router_configure.dart';
import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/shelf_router.dart';

class ApplicationConfig {
  var env = DotEnv(includePlatformEnvironment: true)..load();

  Future<void> loadConfigApplication(Router router) async {
    _loadDatabaseConfig();
    _configLogger();
    _loadDependencies();
    _loadRoutesConfigure(router);
  }

  void _loadDatabaseConfig() {
    final databaseConfig = DatabaseConnectionConfiguration(
      host: env['DATABASE_HOST'] ?? env['databaseHost']!,
      port: int.tryParse(env['DATABASE_PORT'] ?? env['databasePort']!) ?? 0,
      databaseName: env['DATABASE_NAME'] ?? env['databaseName']!,
      username: env['DATABASE_USER'] ?? env['databaseUser']!,
      password: env['DATABASE_PASSWORD'] ?? env['databasePassword']!,
    );

    GetIt.I.registerSingleton<DatabaseConnectionConfiguration>(databaseConfig);
  }

  void _configLogger() =>
      GetIt.I.registerLazySingleton<ILogger>(() => Logger());

  void _loadDependencies() => configureDependencies();

  void _loadRoutesConfigure(Router router) {
    RouterConfigure(router).configure();
  }
}
