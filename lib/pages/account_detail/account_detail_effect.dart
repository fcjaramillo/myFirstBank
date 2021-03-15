import 'package:my_first_bank/viewModel.dart';

abstract class AccountDetailEffect extends Effect{

}

class AccountDetailSnackBarEffect extends AccountDetailEffect {
  final String message;
  final int duration;

  AccountDetailSnackBarEffect(this.message, this.duration);
}