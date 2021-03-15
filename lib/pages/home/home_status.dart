
import 'package:built_collection/built_collection.dart';
import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/viewModel.dart';

class HomeStatus extends ViewStatus {

  final String titleBar;
  final bool isLoading;
  final bool error;
  final String userName;
  final BuiltList<AccountModel> accounts;

  HomeStatus({this.titleBar, this.isLoading, this.error, this.userName, this.accounts});

  HomeStatus copyWith({String titleBar, bool isLoading, bool error, String userName, BuiltList<AccountModel> accounts}){
    return HomeStatus(
      titleBar : titleBar ?? this.titleBar,
      isLoading : isLoading ?? this.isLoading,
      error: error ?? this.error,
      userName: userName ?? this.userName,
      accounts: accounts ?? this.accounts,
    );
  }

}