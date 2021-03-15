// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccountsModel> _$accountsModelSerializer =
    new _$AccountsModelSerializer();

class _$AccountsModelSerializer implements StructuredSerializer<AccountsModel> {
  @override
  final Iterable<Type> types = const [AccountsModel, _$AccountsModel];
  @override
  final String wireName = 'AccountsModel';

  @override
  Iterable<Object> serialize(Serializers serializers, AccountsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.accounts != null) {
      result
        ..add('accounts')
        ..add(serializers.serialize(object.accounts,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AccountModel)])));
    }
    return result;
  }

  @override
  AccountsModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'accounts':
          result.accounts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AccountModel)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$AccountsModel extends AccountsModel {
  @override
  final BuiltList<AccountModel> accounts;

  factory _$AccountsModel([void Function(AccountsModelBuilder) updates]) =>
      (new AccountsModelBuilder()..update(updates)).build();

  _$AccountsModel._({this.accounts}) : super._();

  @override
  AccountsModel rebuild(void Function(AccountsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountsModelBuilder toBuilder() => new AccountsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountsModel && accounts == other.accounts;
  }

  @override
  int get hashCode {
    return $jf($jc(0, accounts.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccountsModel')
          ..add('accounts', accounts))
        .toString();
  }
}

class AccountsModelBuilder
    implements Builder<AccountsModel, AccountsModelBuilder> {
  _$AccountsModel _$v;

  ListBuilder<AccountModel> _accounts;
  ListBuilder<AccountModel> get accounts =>
      _$this._accounts ??= new ListBuilder<AccountModel>();
  set accounts(ListBuilder<AccountModel> accounts) =>
      _$this._accounts = accounts;

  AccountsModelBuilder();

  AccountsModelBuilder get _$this {
    if (_$v != null) {
      _accounts = _$v.accounts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountsModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AccountsModel;
  }

  @override
  void update(void Function(AccountsModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccountsModel build() {
    _$AccountsModel _$result;
    try {
      _$result = _$v ?? new _$AccountsModel._(accounts: _accounts?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'accounts';
        _accounts?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AccountsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
