class DatabaseConnectionConfiguration {
  final String host;
  final int port;
  final String databaseName;
  final String username;
  final String password;

  DatabaseConnectionConfiguration({
    required this.host,
    required this.port,
    required this.databaseName,
    required this.username,
    required this.password,
  });
}
