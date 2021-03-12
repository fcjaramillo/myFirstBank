import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';
import 'package:my_first_bank/configure/get_it_locator.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/pages/login/login_effect.dart';
import 'package:my_first_bank/pages/login/login_view_model.dart';
import 'package:my_first_bank/app_theme.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(
        locator<MFBRoute>(),
      ),
      builder: (context, _){
        return LoginWidget();
      },
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  StreamSubscription<LoginEffect> _effectSubscription;

  @override
  void initState() {

    final viewModel = context.read<LoginViewModel>();

    emailCtrl.text = 'admin@prueba.com';
    passwordCtrl.text = '1234';

    _effectSubscription = viewModel.effects.listen((event) {
      if(event is LoginShowErrorEffect){
        /*context.showBottomSheet(
            icon: GFilesIcon.alert_precaucion,
            iconColor: GFColors.yellowAlert,
            iconColorBg: GFColors.yellowAlertBg,
            textDes: 'El dominio que desea usar no existe',
            textAct: '¿Desea crearlo?',
            textButton: 'Crear Dominio',
            onPressed: viewModel.onTapCreateDomain
        );*/
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _effectSubscription.cancel();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<LoginViewModel>();

    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: MFBColors.white,
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        'Mi Primer Banco',
                        style: textTheme.titleBlue,
                      ),
                      /*Image.asset(
                        IotAssets.logo,
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),*/
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: MFBColors.gray)
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: MFBColors.blue,
                              width: 2.0
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: MFBColors.gray
                            )
                          ),
                        ),
                        controller: emailCtrl,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: MFBColors.gray)
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: MFBColors.blue,
                              width: 2.0
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: MFBColors.gray
                            )
                          ),
                        ),
                        controller: passwordCtrl,
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text(
                          'Recuperar Contraseña',
                          style: textTheme.titleGray,
                        )
                      ),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: Text(
                          'Entrar',
                          style: textTheme.textButtomWhite.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        color: MFBColors.blue,
                        textColor: MFBColors.white,
                        onPressed: (){
                          viewModel.onTapLogin(emailCtrl.text, passwordCtrl.text);
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '¿Aun no tienes cuenta?',
                        style: textTheme.titleGray,
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text(
                          'Registrate Aquí',
                          style: textTheme.titleGray.copyWith(
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
