import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/data/database.dart';
import 'package:my_first_bank/pages/scan_qr/scan_qr_effect.dart';
import 'package:my_first_bank/pages/scan_qr/scan_qr_status.dart';
import 'package:my_first_bank/viewModel.dart';


class ScanQrViewModel extends EffectsViewModel<ScanQrStatus, ScanQrEffect>{

  final MFBRoute _route;
  final Database _database;

  ScanQrViewModel(this._route, this._database){
    status = ScanQrStatus(
      isLoading: true,
      titleBar: 'Escanear codigo QR',
      error: false,
      stringQr: 'Sin Resultado'
    );
  }

  void onTapScan() async {
    String scan = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);
    status = status.copyWith(stringQr: scan);
  }


}