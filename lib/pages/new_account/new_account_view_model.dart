import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/data/database.dart';
import 'package:my_first_bank/data/model/account_db.dart';
import 'package:my_first_bank/pages/new_account/new_account_effect.dart';
import 'package:my_first_bank/pages/new_account/new_account_status.dart';
import 'package:my_first_bank/viewModel.dart';

class NewAccountViewModel extends EffectsViewModel<NewAccountStatus, NewAccountEffect> {
  final MFBRoute _route;
  final Database _database;

  NewAccountViewModel(this._route, this._database){
    status = NewAccountStatus(
      isLoading: true,
      titleBar: 'NewAccount',
      error: false,
      strType: ''
    );
  }

  void onTapValidate(){
    addEffect(NewAccountFormValidate());
  }

  void onTapNewAccount(String type, String number, String balance, String alias, String idTitular, String bank) async {
    /*await _database.setOnlyAccount(AccountDb(0,1,type,int.parse(number),double.parse(balance),alias,int.parse(idTitular),bank));
    _route.pop(true);*/
  }

  void onChangeType(String value){
    status = status.copyWith(strType: value);
  }

  String validateType(String value){
    if (status.strType == ''){
      return "El tipo de cuenta es necesario.";
    }
    return null;
  }

  String validateNumber(String value){
    if (value == ''){
      return "Su número de cuenta es necesario.";
    } else if (value.length != 11){
      return "Su número de cuenta debe tener 11 digitos.";
    }
    return null;
  }

  String validateBalance(String value){
    if (value == ''){
      return "Su número de cuenta es necesario.";
    }
    return null;
  }

  String validateIdTitular(String value){
    if (value == ''){
      return "Su cedula es necesaria.";
    } else if (value.length != 12){
      return "Su cedula debe tener 12 digitos.";
    }
    return null;
  }

  String validateBank(String value){
    if (value == ''){
      return "El nombre del banco es necesario.";
    }
    return null;
  }

}