import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';
import 'package:my_first_bank/configure/get_it_locator.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/app_theme.dart';
import 'package:my_first_bank/data/database.dart';
import 'package:my_first_bank/pages/edit_account/edit_account_effect.dart';
import 'package:my_first_bank/pages/edit_account/edit_account_view_model.dart';

import 'package:provider/provider.dart';

class EditAccountPage extends StatelessWidget {

  final AccountModel _account;
  final int _index;

  EditAccountPage(this._account, this._index);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditAccountViewModel(
        locator<MFBRoute>(),
        locator<Database>(),
        _account,
        _index,
      ),
      builder: (context, _){
        return EditAccountWidget();
      },
    );
  }
}

class EditAccountWidget extends StatefulWidget {
  @override
  _EditAccountWidgetState createState() => _EditAccountWidgetState();
}

class _EditAccountWidgetState extends State<EditAccountWidget> {

  final keyFormAddAccount = GlobalKey<FormState>();
  final numberCtrl = TextEditingController();
  final balanceCtrl = TextEditingController();
  final aliasCtrl = TextEditingController();
  final idTitularCtrl = TextEditingController();
  final bankCtrl = TextEditingController();

  StreamSubscription<EditAccountEffect> _effectSubscription;

  @override
  void initState() {

    final viewModel = context.read<EditAccountViewModel>();

    numberCtrl.text = viewModel.status.account.number.toString();
    balanceCtrl.text = viewModel.status.account.balance.toString();
    aliasCtrl.text = viewModel.status.account.alias;
    idTitularCtrl.text = viewModel.status.account.idTitular.toString();
    bankCtrl.text = viewModel.status.account.bank;

    _effectSubscription = viewModel.effects.listen((event) {
      if(event is EditAccountFormValidate){
        if(keyFormAddAccount.currentState.validate()){
          viewModel.onTapEditAccount(
            aliasCtrl.text,
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

    final viewModel = context.watch<EditAccountViewModel>();

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
                    //todo
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      focusNode: FocusNode(),
                      enableInteractiveSelection: false,
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
                      readOnly: true,
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
                      readOnly: true,
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
                      readOnly: true,
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
                      readOnly: true,
                      controller: bankCtrl,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: Text(
                        'Editar Cuenta',
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
