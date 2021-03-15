import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/pages/account_detail/account_detail_effect.dart';
import 'package:my_first_bank/pages/account_detail/account_detail_status.dart';
import 'package:my_first_bank/viewModel.dart';

class AccountDetailViewModel extends EffectsViewModel<AccountDetailStatus, AccountDetailEffect>{

  final MFBRoute _route;
  final AccountModel _account;

  AccountDetailViewModel(this._route, this._account){
    status = AccountDetailStatus(
      titleBar: _account.type,
      isLoading: true,
      error: false,
      account: _account,
      indexTab: 0,
      colorTabDetail: MFBColors.blueDark,
      colorTabMovements: MFBColors.gray,
    );
  }

  void onTapTab(int index) {
    switch(index){
      case 0:
        status = status.copyWith(indexTab: index, colorTabDetail: MFBColors.blueDark, colorTabMovements: MFBColors.gray);
        break;
      case 1:
        status = status.copyWith(indexTab: index, colorTabDetail: MFBColors.gray, colorTabMovements: MFBColors.blueDark);
        break;
    }
  }

}