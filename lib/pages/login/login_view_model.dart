import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/data/database.dart';
import 'package:my_first_bank/data/model/user_db.dart';
import 'package:my_first_bank/pages/login/login_effect.dart';
import 'package:my_first_bank/pages/login/login_status.dart';
import 'package:my_first_bank/viewModel.dart';

class LoginViewModel extends EffectsViewModel<LoginStatus, LoginEffect> {
  final MFBRoute _route;
  final Database _database;

  LoginViewModel(this._route, this._database){
    status = LoginStatus(
      isLoading: true,
      titleBar: 'Login',
      error: false
    );
  }

  void onTapLogin(String email, String password) async {
    if(email == 'admin@prueba.com' && password == '1234'){
      await _database.setLoginUser(UserDb('Fabián Jaramillo'));
      _route.goHome();
    }else {

    }
  }

}