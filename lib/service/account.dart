import 'package:foxy/model/account.dart';
import 'package:foxy/service/service.dart';

class AccountService with Service {
  final database = databases.where((element) => element.contains('auth')).first;

  Future<Account?> login(String username) async {
    var result = await pool.execute(
      'select id, username from $database.account',
    );
    final accounts =
        result.rows.map((row) => Account.fromJson(row.typedAssoc()));
    final account = accounts
        .where((element) => element.username == username.toUpperCase())
        .firstOrNull;
    return account;
  }
}
