import 'package:get_it/get_it.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/data/database.dart';


GetIt locator = GetIt.instance;

void setUpLocator() async {

  locator.registerSingleton<MFBRoute>(MFBRoute());

  locator.registerSingletonAsync(() async {
    final database = Database();
    await database.initDb();
    return database;
  });
}