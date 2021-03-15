
import 'package:flutter/material.dart';
import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/pages/account_detail/account_detail_page.dart';
import 'package:my_first_bank/pages/home/home_page.dart';
import 'package:my_first_bank/pages/login/login_page.dart';

class MFBRoute {

  static final MFBRoute _singleton = MFBRoute._internal();

  factory MFBRoute() {
    return _singleton;
  }

  MFBRoute._internal();


  final navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => LoginPage());
  }

  void pop<T>(T result){
    navigatorKey.currentState.pop<T>(result);
  }

  goHome(){
    return navigatorKey.currentState.pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage())
    );
  }

  goLogin(){
    return navigatorKey.currentState.pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage())
    );
  }

  goAccountDetail(AccountModel account){
    return navigatorKey.currentState.push(
      MaterialPageRoute(builder: (_) => AccountDetailPage(account))
    );
  }

}
