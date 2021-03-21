import 'package:flutter/material.dart';
import 'package:my_first_bank/app_theme.dart';
import 'package:my_first_bank/configure/get_it_locator.dart';
import 'package:my_first_bank/configure/mfb_route.dart';

void main() async {
  setUpLocator();
  await locator.allReady();
  await locator<MFBRoute>().init();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MFBRoute().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'My First Bank',
      theme: AppTheme.build(),
      onGenerateRoute: locator<MFBRoute>().generateRoute,
    );
  }
}
