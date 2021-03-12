import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/pages/login/login_effect.dart';
import 'package:my_first_bank/pages/login/login_status.dart';
import 'package:my_first_bank/viewModel.dart';

class LoginViewModel extends EffectsViewModel<LoginStatus, LoginEffect> {
  final MFBRoute _route;

  LoginViewModel(this._route){
    status = LoginStatus(
      isLoading: true,
      titleBar: 'Login',
      error: false
    );
  }

  void onTapLogin(String email, String password) async {
    if(email == 'admin@prueba.com' && password == '1234'){
      _route.goHome();
    }else {

    }
  }

}