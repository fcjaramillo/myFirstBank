import 'package:my_first_bank/viewModel.dart';

abstract class ScanQrEffect extends Effect{

}

class ScanQrSnackBarEffect extends ScanQrEffect {
  final String message;
  final int duration;

  ScanQrSnackBarEffect(this.message, this.duration);
}