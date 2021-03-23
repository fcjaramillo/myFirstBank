import 'package:my_first_bank/viewModel.dart';

class ScanQrStatus extends ViewStatus {

  final String titleBar;
  final bool isLoading;
  final bool error;
  final String stringQr;

  ScanQrStatus({this.titleBar, this.isLoading, this.error, this.stringQr});

  ScanQrStatus copyWith({String titleBar, bool isLoading, bool error, String stringQr}){
    return ScanQrStatus(
      titleBar : titleBar ?? this.titleBar,
      isLoading : isLoading ?? this.isLoading,
      error: error ?? this.error,
      stringQr: stringQr ?? this.stringQr,
    );
  }

}