import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/data/database.dart';
import 'package:my_first_bank/data/model/account_db.dart';
import 'package:my_first_bank/pages/edit_account/edit_account_effect.dart';
import 'package:my_first_bank/pages/edit_account/edit_account_status.dart';
import 'package:my_first_bank/viewModel.dart';

class EditAccountViewModel extends EffectsViewModel<EditAccountStatus, EditAccountEffect> {
  final MFBRoute _route;
  final Database _database;
  final AccountModel _account;
  final int _index;

  EditAccountViewModel(this._route, this._database, this._account, this._index){
    status = EditAccountStatus(
      isLoading: true,
      titleBar: 'EditAccount',
      account: _account,
    );
  }

  void onTapValidate(){
    addEffect(EditAccountFormValidate());
  }

  void onTapEditAccount(String alias) async {
    await _database.setEditAccount(AccountDb(
      status.account.id,
      status.account.idUser,
      status.account.type,
      status.account.number,
      status.account.balance,
      alias,
      status.account.idTitular,
      status.account.bank), _index
    );
    _route.pop(true);
  }

}