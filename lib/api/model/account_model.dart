import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:my_first_bank/api/repository/serializer/serializers.dart';

part 'account_model.g.dart';

abstract class AccountModel implements Built<AccountModel, AccountModelBuilder> {

  int get id;

  @nullable
  int get idUser;

  @nullable
  String get type;

  @nullable
  int get number;

  @nullable
  double get balance;

  @nullable
  String get alias;

  @nullable
  int get idTitular;

  AccountModel._();
  factory AccountModel([void Function(AccountModelBuilder) updates]) = _$AccountModel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AccountModel.serializer, this);
  }

  static AccountModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AccountModel.serializer, json);
  }

  static Serializer<AccountModel> get serializer => _$accountModelSerializer;
}