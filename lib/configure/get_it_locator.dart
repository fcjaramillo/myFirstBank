import 'package:get_it/get_it.dart';
import 'package:my_first_bank/configure/mfb_route.dart';


GetIt locator = GetIt.instance;

void setUpLocator() async {

  locator.registerSingleton<MFBRoute>(MFBRoute());

}