import 'package:my_first_bank/viewModel.dart';

class LoginStatus extends ViewStatus {
  final String titleBar;
  final bool isLoading;
  final bool error;

  LoginStatus({this.titleBar, this.isLoading, this.error});

  LoginStatus copyWith({String titleBar, bool isLoading, bool error}){
    return LoginStatus(
      titleBar : titleBar ?? this.titleBar,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error
    );
  }

}