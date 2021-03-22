import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_first_bank/data/model/account_db.dart';

import 'model/user_db.dart';

class Database {
  Box userBox;

  Future initDb() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserDbAdapter());
    Hive.registerAdapter(AccountDbAdapter());
  }

  close() => Hive.close();

  //LOGIN USER
  Future setLoginUser(UserDb login) async {
    var box = await Hive.openBox('user');
    if (box.length > 0){
      await box.putAt(0, login);
    } else {
      await box.add(login);
    }
  }

  Future<UserDb> getLoginUser() async {
    var box = await Hive.openBox('user');
    UserDb lm = UserDb();
    for (int i = 0; i < box.length; i++) {
      lm = box.getAt(i);
    }
    return lm;
  }

  Future deleteUser() async {
    var box = await Hive.openBox('user');
    box.deleteAt(0);
  }
  //FIN LOGIN USER

  //ACCOUNT
  Future setAccount(AccountDb account, int index) async {
    var box = await Hive.openBox('account');
    if (box.length > 2){
      await box.putAt(index, account);
    } else {
      await box.add(account);
    }
  }

  Future setOnlyAccount(AccountDb account) async {
    var box = await Hive.openBox('account');
    await box.add(account);
  }

  Future setEditAccount(AccountDb account, int index) async {
    var box = await Hive.openBox('account');
    await box.putAt(index, account);
  }

  Future<List<AccountDb>> getAccounts() async {
    var box = await Hive.openBox('account');
    //list<AccountDb> lm = AccountDb();
    AccountDb accountDb = AccountDb();
    List<AccountDb> lm = [];
    for (int i = 0; i < box.length; i++) {
      accountDb = box.getAt(i);
      lm.add(accountDb);
    }
    return lm;
  }
  //FIN ACCOUNT

}
