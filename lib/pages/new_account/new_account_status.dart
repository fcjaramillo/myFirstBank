import 'package:my_first_bank/viewModel.dart';

class NewAccountStatus extends ViewStatus {
  final String titleBar;
  final bool isLoading;
  final bool error;
  final String strType;

  NewAccountStatus({this.titleBar, this.isLoading, this.error, this.strType});

  NewAccountStatus copyWith({String titleBar, bool isLoading, bool error, String strType}){
    return NewAccountStatus(
      titleBar : titleBar ?? this.titleBar,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      strType: strType ?? this.strType
    );
  }

}