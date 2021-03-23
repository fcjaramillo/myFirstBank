import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_first_bank/commons/mfb_colors.dart';
import 'package:my_first_bank/configure/get_it_locator.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/data/database.dart';
import 'package:my_first_bank/pages/scan_qr/scan_qr_view_model.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:my_first_bank/app_theme.dart';

import 'scan_qr_effect.dart';

class ScanQrPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScanQrViewModel(
        locator<MFBRoute>(),
        locator<Database>(),
      ),
      builder: (context, _){
        return ScanQrWidget();
      },
    );
  }
}

class ScanQrWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ScanQrViewModel>();

    return Scaffold(
      backgroundColor: MFBColors.white,
      appBar: AppBar(
        title: Text(
          viewModel.status.titleBar,
        ),
      ),
      body: _ScanQrBody(),
    );
  }
}

class _ScanQrBody extends StatefulWidget {
  @override
  __ScanQrBodyState createState() => __ScanQrBodyState();
}

class __ScanQrBodyState extends State<_ScanQrBody> {

  final stringQrCtrl = TextEditingController();

  StreamSubscription<ScanQrEffect> _effectSubscription;

  @override
  void initState() {

    final viewModel = context.read<ScanQrViewModel>();

    stringQrCtrl.text = viewModel.status.stringQr;

    _effectSubscription = viewModel.effects.listen((event) {
      if(event is ScanQrSnackBarEffect){
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

    final viewModel = context.watch<ScanQrViewModel>();

    final textTheme = Theme.of(context).textTheme;

    var loading = viewModel.status.isLoading ? CircularProgressIndicator() : SizedBox.shrink();
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Resultado'
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              viewModel.status.stringQr
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                'Escanear Codigo QR',
                style: textTheme.textButtomWhite.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              color: MFBColors.blue,
              textColor: MFBColors.white,
              onPressed: viewModel.onTapScan,
            )
          ],
        ),
      ),
    );
  }
}