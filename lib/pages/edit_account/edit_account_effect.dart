import 'package:my_first_bank/viewModel.dart';

abstract class EditAccountEffect extends Effect {

}

class EditAccountShowErrorEffect extends EditAccountEffect {
  final String message;

  EditAccountShowErrorEffect(this.message);
}

class EditAccountFormValidate extends EditAccountEffect {
  EditAccountFormValidate();
}