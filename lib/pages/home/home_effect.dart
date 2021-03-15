import 'package:my_first_bank/viewModel.dart';

abstract class HomeEffect extends Effect{

}

class HomeSnackBarEffect extends HomeEffect {
  final String message;
  final int duration;

  HomeSnackBarEffect(this.message, this.duration);
}