import 'package:flutter/cupertino.dart';
import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/viewModel.dart';

class AccountDetailStatus extends ViewStatus {

  final String titleBar;
  final bool isLoading;
  final bool error;
  final AccountModel account;
  final int indexTab;
  final Color colorTabDetail;
  final Color colorTabMovements;


  AccountDetailStatus({
      this.titleBar,
      this.isLoading,
      this.error,
      this.account,
      this.indexTab,
      this.colorTabDetail,
      this.colorTabMovements});

  AccountDetailStatus copyWith({
    String titleBar,
    bool isLoading,
    bool error,
    AccountModel account,
    int indexTab,
    Color colorTabDetail,
    Color colorTabMovements,
  }){
    return AccountDetailStatus(
      titleBar : titleBar ?? this.titleBar,
      isLoading : isLoading ?? this.isLoading,
      error: error ?? this.error,
      account: account ?? this.account,
      indexTab: indexTab ?? this.indexTab,
      colorTabDetail: colorTabDetail ?? this.colorTabDetail,
      colorTabMovements: colorTabMovements ?? this.colorTabMovements,
    );
  }

}