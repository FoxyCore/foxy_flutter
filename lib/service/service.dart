import 'package:mysql_client/mysql_client.dart';

late MySQLConnectionPool pool;
List<String> databases = [];
mixin Service {
  void init({
    String host = 'localhost',
    int port = 3306,
    required String username,
    required String password,
    int maxConnections = 10,
  }) async {
    pool = MySQLConnectionPool(
      host: host,
      port: port,
      userName: username,
      password: password,
      maxConnections: maxConnections,
    );
  }

  void close() {
    pool.close();
  }

  void getDatabases() async {
    final result = await pool.execute('show databases;');
    for (var row in result.rows) {
      databases.add(row.colByName('Database') ?? '');
    }
  }
}

class ServiceInitializer with Service {
  void ensureInitialized() {
    init(username: 'root', password: 'root', host: '192.168.1.166', port: 3306);
    getDatabases();
  }
}
