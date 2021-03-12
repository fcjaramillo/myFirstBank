import 'package:my_first_bank/viewModel.dart';

abstract class LoginEffect extends Effect {

}

class LoginShowErrorEffect extends LoginEffect {
  final String message;

  LoginShowErrorEffect(this.message);
}

class ValueControllerDomainEffect extends LoginEffect {
  final String message;

  ValueControllerDomainEffect(this.message);
}