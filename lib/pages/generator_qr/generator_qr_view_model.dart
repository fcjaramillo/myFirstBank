import 'package:my_first_bank/configure/mfb_route.dart';
import 'package:my_first_bank/data/database.dart';
import 'package:my_first_bank/pages/generator_qr/generator_qr_effect.dart';
import 'package:my_first_bank/pages/generator_qr/generator_qr_status.dart';
import 'package:my_first_bank/viewModel.dart';


class GeneratorQrViewModel extends EffectsViewModel<GeneratorQrStatus, GeneratorQrEffect>{

  final MFBRoute _route;
  final Database _database;

  GeneratorQrViewModel(this._route, this._database){
    status = GeneratorQrStatus(
      isLoading: true,
      titleBar: 'Generar codigo QR',
      error: false,
      stringQr: 'https://github.com/fcjaramillo/myFirstBank'
    );
  }

  void onTapGenerator(String stringQr){
    status = status.copyWith(stringQr: stringQr);
  }


}