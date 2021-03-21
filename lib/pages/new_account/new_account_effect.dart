import 'package:my_first_bank/viewModel.dart';

abstract class NewAccountEffect extends Effect {

}

class NewAccountShowErrorEffect extends NewAccountEffect {
  final String message;

  NewAccountShowErrorEffect(this.message);
}

class NewAccountFormValidate extends NewAccountEffect {
  NewAccountFormValidate();
}