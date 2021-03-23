import 'package:my_first_bank/viewModel.dart';

abstract class GeneratorQrEffect extends Effect{

}

class GeneratorQrSnackBarEffect extends GeneratorQrEffect {
  final String message;
  final int duration;

  GeneratorQrSnackBarEffect(this.message, this.duration);
}