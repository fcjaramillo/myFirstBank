import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';
import 'package:my_first_bank/configure/get_it_locator.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/app_theme.dart';
import 'package:my_first_bank/data/database.dart';
import 'package:my_first_bank/pages/new_account/new_account_effect.dart';
import 'package:my_first_bank/pages/new_account/new_account_view_model.dart';

import 'package:provider/provider.dart';

class NewAccountPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewAccountViewModel(
        locator<MFBRoute>(),
        locator<Database>(),
      ),
      builder: (context, _){
        return NewAccountWidget();
      },
    );
  }
}

class NewAccountWidget extends StatefulWidget {
  @override
  _NewAccountWidgetState createState() => _NewAccountWidgetState();
}

class _NewAccountWidgetState extends State<NewAccountWidget> {

  final keyFormAddAccount = GlobalKey<FormState>();
  final numberCtrl = TextEditingController();
  final balanceCtrl = TextEditingController();
  final aliasCtrl = TextEditingController();
  final idTitularCtrl = TextEditingController();
  final bankCtrl = TextEditingController();

  StreamSubscription<NewAccountEffect> _effectSubscription;

  @override
  void initState() {

    final viewModel = context.read<NewAccountViewModel>();

    _effectSubscription = viewModel.effects.listen((event) {
      if(event is NewAccountFormValidate){
        print('jajajaja');
        if(keyFormAddAccount.currentState.validate()){
          viewModel.onTapNewAccount(
            viewModel.status.strType,
            numberCtrl.text,
            balanceCtrl.text,
            aliasCtrl.text,
            idTitularCtrl.text,
            bankCtrl.text,
          );
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _effectSubscription.cancel();
    numberCtrl.dispose();
    balanceCtrl.dispose();
    aliasCtrl.dispose();
    idTitularCtrl.dispose();
    bankCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<NewAccountViewModel>();

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nueva Cuenta Bancaria'
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Form(
                key: keyFormAddAccount,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(
                          child: Text('Cuenta de Ahorros'),
                          value: 'Cuenta de Ahorros',
                        ),
                        DropdownMenuItem(
                          child: Text('Cuenta Corriente'),
                          value: 'Cuenta Corriente',
                        )
                      ],
                      decoration: InputDecoration(
                        labelText: 'Tipo de Cuenta ',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: MFBColors.gray)
                        )
                      ),
                      icon: Icon(Icons.keyboard_arrow_down),
                      validator: viewModel.validateType,
                      onChanged: viewModel.onChangeType
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Numero de Cuenta',
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
                      keyboardType: TextInputType.number,
                      validator: viewModel.validateNumber,
                      controller: numberCtrl,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Saldo',
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
                      keyboardType: TextInputType.number,
                      validator: viewModel.validateBalance,
                      controller: balanceCtrl,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Alias',
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
                      controller: aliasCtrl,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Cedula Titular',
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
                      keyboardType: TextInputType.number,
                      validator: viewModel.validateIdTitular,
                      controller: idTitularCtrl,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Banco',
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
                      validator: viewModel.validateBank,
                      controller: bankCtrl,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: Text(
                        'Agregar Cuenta',
                        style: textTheme.textButtomWhite.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      color: MFBColors.blue,
                      textColor: MFBColors.white,
                      onPressed: viewModel.onTapValidate,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
