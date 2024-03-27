import 'package:foxy/model/account.dart';
import 'package:foxy/service/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account.g.dart';

@riverpod
class AccountNotifier extends _$AccountNotifier {
  @override
  Future<Account> build() async {
    return Account();
  }

  Future<void> login(String username) async {
    final service = AccountService();
    final account = await service.login(username) ?? Account();
    state = AsyncData(account);
  }
}
