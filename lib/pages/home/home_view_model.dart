import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/api/model/accounts_model.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/pages/home/home_effect.dart';
import 'package:my_first_bank/pages/home/home_status.dart';
import 'package:my_first_bank/viewModel.dart';


class HomeViewModel extends EffectsViewModel<HomeStatus, HomeEffect>{

  final MFBRoute _route;

  HomeViewModel(this._route){
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
      print('a');

      final String response = await rootBundle.loadString('assets/jsons/accounts.json');
      final data = await json.decode(response);


      final AccountsModel accountsModel = AccountsModel.fromJson(data);
      //print(a);

      status = status.copyWith(accounts: accountsModel.accounts, isLoading: false);
      //}

      //List<AccountModel> response = await locator<ApiInteractor>().getAllEarthquake();
      //status = status.copyWith(earthquakes: response, isLoading: false);
    } else {
      UnimplementedError();
    }
  }

  void onTapCard(AccountModel account) async {
    print(account);
    //await _route.goEarthquakeDetail(earthquake, sim, heightModels);
    await _route.goAccountDetail(account);
  }

  void onTapDrawer(String page){
    //TODO
    print(page);
  }

  void onTapCloseSession() async {
    await _route.goLogin();
  }

}