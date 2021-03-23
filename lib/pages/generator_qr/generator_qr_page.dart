import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';
import 'package:my_first_bank/configure/get_it_locator.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/data/database.dart';
import 'package:my_first_bank/pages/generator_qr/generator_qr_view_model.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:my_first_bank/app_theme.dart';

import 'generator_qr_effect.dart';

class GeneratorQrPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GeneratorQrViewModel(
        locator<MFBRoute>(),
        locator<Database>(),
      ),
      builder: (context, _){
        return GeneratorQrWidget();
      },
    );
  }
}

class GeneratorQrWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GeneratorQrViewModel>();

    return Scaffold(
      backgroundColor: MFBColors.white,
      appBar: AppBar(
        title: Text(
          viewModel.status.titleBar,
        ),
      ),
      body: _generatorQrBody(),
    );
  }
}

class _generatorQrBody extends StatefulWidget {
  @override
  __generatorQrBodyState createState() => __generatorQrBodyState();
}

class __generatorQrBodyState extends State<_generatorQrBody> {

  final stringQrCtrl = TextEditingController();

  StreamSubscription<GeneratorQrEffect> _effectSubscription;

  @override
  void initState() {

    final viewModel = context.read<GeneratorQrViewModel>();

    stringQrCtrl.text = viewModel.status.stringQr;

    _effectSubscription = viewModel.effects.listen((event) {
      if(event is GeneratorQrSnackBarEffect){
        //GlobalSnackbar.buildErrorSnackbar(context, event.message, event.duration);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _effectSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<GeneratorQrViewModel>();

    final textTheme = Theme.of(context).textTheme;

    var loading = viewModel.status.isLoading ? CircularProgressIndicator() : SizedBox.shrink();
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QrImage(
              data: viewModel.status.stringQr
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Obtener el codigo QR del texto',
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
              controller: stringQrCtrl,
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                'Generar Codigo QR',
                style: textTheme.textButtomWhite.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              color: MFBColors.blue,
              textColor: MFBColors.white,
              //onPressed: viewModel.onTapGenerate,
              onPressed: (){
                viewModel.onTapGenerator(stringQrCtrl.text);
              },
            )
          ],
        ),
      ),
    );
  }
}