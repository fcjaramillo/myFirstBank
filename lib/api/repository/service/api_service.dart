import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:my_first_bank/api/repository/converter/built_value_converter.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/api')
abstract class EarthquakeApiService extends ChopperService {



  static EarthquakeApiService create() {
    final client = ChopperClient(
      baseUrl: 'http://192.168.0.16:5000',
      services: [
        _$EarthquakeApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$EarthquakeApiService(client);
  }
}