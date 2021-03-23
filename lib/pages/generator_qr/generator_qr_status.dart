import 'package:built_collection/built_collection.dart';
import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/viewModel.dart';

class GeneratorQrStatus extends ViewStatus {

  final String titleBar;
  final bool isLoading;
  final bool error;
  final String stringQr;

  GeneratorQrStatus({this.titleBar, this.isLoading, this.error, this.stringQr});

  GeneratorQrStatus copyWith({String titleBar, bool isLoading, bool error, String stringQr}){
    return GeneratorQrStatus(
      titleBar : titleBar ?? this.titleBar,
      isLoading : isLoading ?? this.isLoading,
      error: error ?? this.error,
      stringQr: stringQr ?? this.stringQr,
    );
  }

}