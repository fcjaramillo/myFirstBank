import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:my_first_bank/api/model/account_model.dart';
import 'package:my_first_bank/api/repository/serializer/serializers.dart';

part 'accounts_model.g.dart';

abstract class AccountsModel implements Built<AccountsModel, AccountsModelBuilder> {
  
  @nullable
  BuiltList<AccountModel> get accounts;

  AccountsModel._();
  factory AccountsModel([void Function(AccountsModelBuilder) updates]) = _$AccountsModel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AccountsModel.serializer, this);
  }

  static AccountsModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AccountsModel.serializer, json);
  }

  static Serializer<AccountsModel> get serializer => _$accountsModelSerializer;
}