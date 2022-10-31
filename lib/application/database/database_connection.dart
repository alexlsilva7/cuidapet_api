import 'package:cuidapet_api/application/config/dabase_connection_configuration.dart';
import 'package:cuidapet_api/application/database/i_database_connection.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/src/single_connection.dart';

@LazySingleton(as: IDatabaseConnection)
class DatabaseConnection extends IDatabaseConnection {
  final DatabaseConnectionConfiguration _configuration;

  DatabaseConnection(this._configuration);

  @override
  Future<MySqlConnection> getDatabase() {
    return MySqlConnection.connect(ConnectionSettings(
      host: _configuration.host,
      port: _configuration.port,
      user: _configuration.username,
      password: _configuration.password,
      db: _configuration.databaseName,
    ));
  }
}
