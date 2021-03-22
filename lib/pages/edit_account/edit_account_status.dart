import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/viewModel.dart';

class EditAccountStatus extends ViewStatus {
  final String titleBar;
  final bool isLoading;
  final AccountModel account;

  EditAccountStatus({this.titleBar, this.isLoading, this.account});

  EditAccountStatus copyWith({String titleBar, bool isLoading, AccountModel account}){
    return EditAccountStatus(
      titleBar : titleBar ?? this.titleBar,
      isLoading: isLoading ?? this.isLoading,
      account: account ?? this.account
    );
  }

}