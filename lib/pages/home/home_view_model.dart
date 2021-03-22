import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/api/model/accounts_model.dart';
import 'package:my_first_bank/configure/get_it_locator.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/data/database.dart';
import 'package:my_first_bank/data/model/account_db.dart';
import 'package:my_first_bank/pages/home/home_effect.dart';
import 'package:my_first_bank/pages/home/home_status.dart';
import 'package:my_first_bank/viewModel.dart';


class HomeViewModel extends EffectsViewModel<HomeStatus, HomeEffect>{

  final MFBRoute _route;
  final Database _database;

  HomeViewModel(this._route, this._database){
    status = HomeStatus(
      isLoading: true,
      titleBar: 'Cuentas Bancarias',
      error: false,
      userName: 'Fabián Camilo Jaramillo Ortiz',
      accounts: BuiltList<AccountModel>(),
    );
  }

  void onInit() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {


      List<AccountDb> accounts = await _database.getAccounts();
      if(accounts.length > 0) {

        BuiltList<AccountModel> listAccountsModel = BuiltList<AccountModel>();

        accounts.forEach((element) {
          AccountModel accountModel = AccountModel( (ac) => ac
            ..id = element.id
            ..idUser = element.idUser
            ..type = element.type
            ..number = element.number
            ..balance = element.balance
            ..alias = element.alias
            ..idTitular = element.idTitular
            ..bank = element.bank
          );
          listAccountsModel = listAccountsModel.rebuild( (acs) => acs
            ..add(accountModel)
          );
        });

        status = status.copyWith(accounts: listAccountsModel, isLoading: false);
      } else {
        final String response = await rootBundle.loadString('assets/jsons/accounts.json');
        final data = await json.decode(response);

        final AccountsModel accountsModel = AccountsModel.fromJson(data);

        accountsModel.accounts.asMap().forEach((n, account) {
          _database.setAccount(AccountDb(
            account.id,
            account.idUser,
            account.type,
            account.number,
            account.balance,
            account.alias,
            account.idTitular,
            account.bank
          ), n);
        });

        status = status.copyWith(accounts: accountsModel.accounts, isLoading: false);
      }
    } else {
      UnimplementedError();
    }
  }

  void onTapCard(AccountModel account) async {
    await _route.goAccountDetail(account);
  }

  void onTapFloating() async {
    bool create = await _route.goNewAccount();
    if(create){
      onInit();
    }
  }

  void onTapDrawer(String page){
    //TODO
    //print(page);
  }

  void onTapCloseSession() async {
    _database.deleteUser();
    await _route.goLogin();
  }

  void onTapSettings(AccountModel account, int index) async {
    bool edit = await _route.goEditAccount(account, index);
    if(edit){
      onInit();
    }
  }

}