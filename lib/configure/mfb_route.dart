
import 'package:flutter/material.dart';
import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/configure/get_it_locator.dart';
import 'package:my_first_bank/data/database.dart';
import 'package:my_first_bank/data/model/user_db.dart';
import 'package:my_first_bank/pages/account_detail/account_detail_page.dart';
import 'package:my_first_bank/pages/edit_account/edit_account_page.dart';
import 'package:my_first_bank/pages/home/home_page.dart';
import 'package:my_first_bank/pages/login/login_page.dart';
import 'package:my_first_bank/pages/new_account/new_account_page.dart';

class MFBRoute {

  static final MFBRoute _singleton = MFBRoute._internal();

  factory MFBRoute() {
    return _singleton;
  }

  MFBRoute._internal();

  UserDb user;

  init() async {
    user = await locator<Database>().getLoginUser();
  }

  final navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> generateRoute(RouteSettings settings) {
    if(user.name == null){
      return MaterialPageRoute(builder: (_) => LoginPage());
    } else {
      return MaterialPageRoute(builder: (_) => HomePage());
    }

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

  goNewAccount(){
    return navigatorKey.currentState.push(
        MaterialPageRoute(builder: (_) => NewAccountPage())
    );
  }

  goEditAccount(AccountModel account, int index){
    return navigatorKey.currentState.push(
        MaterialPageRoute(builder: (_) => EditAccountPage(account, index))
    );
  }

}
