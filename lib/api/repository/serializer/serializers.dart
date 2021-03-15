import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/api/model/accounts_model.dart';

part 'serializers.g.dart';

@SerializersFor([
    AccountsModel,
    AccountModel
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
