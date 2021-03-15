// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccountModel> _$accountModelSerializer =
    new _$AccountModelSerializer();

class _$AccountModelSerializer implements StructuredSerializer<AccountModel> {
  @override
  final Iterable<Type> types = const [AccountModel, _$AccountModel];
  @override
  final String wireName = 'AccountModel';

  @override
  Iterable<Object> serialize(Serializers serializers, AccountModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];
    if (object.idUser != null) {
      result
        ..add('idUser')
        ..add(serializers.serialize(object.idUser,
            specifiedType: const FullType(int)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    if (object.number != null) {
      result
        ..add('number')
        ..add(serializers.serialize(object.number,
            specifiedType: const FullType(int)));
    }
    if (object.balance != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(object.balance,
            specifiedType: const FullType(double)));
    }
    if (object.alias != null) {
      result
        ..add('alias')
        ..add(serializers.serialize(object.alias,
            specifiedType: const FullType(String)));
    }
    if (object.idTitular != null) {
      result
        ..add('idTitular')
        ..add(serializers.serialize(object.idTitular,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AccountModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'idUser':
          result.idUser = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'alias':
          result.alias = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'idTitular':
          result.idTitular = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$AccountModel extends AccountModel {
  @override
  final int id;
  @override
  final int idUser;
  @override
  final String type;
  @override
  final int number;
  @override
  final double balance;
  @override
  final String alias;
  @override
  final int idTitular;

  factory _$AccountModel([void Function(AccountModelBuilder) updates]) =>
      (new AccountModelBuilder()..update(updates)).build();

  _$AccountModel._(
      {this.id,
      this.idUser,
      this.type,
      this.number,
      this.balance,
      this.alias,
      this.idTitular})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('AccountModel', 'id');
    }
  }

  @override
  AccountModel rebuild(void Function(AccountModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountModelBuilder toBuilder() => new AccountModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountModel &&
        id == other.id &&
        idUser == other.idUser &&
        type == other.type &&
        number == other.number &&
        balance == other.balance &&
        alias == other.alias &&
        idTitular == other.idTitular;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), idUser.hashCode),
                        type.hashCode),
                    number.hashCode),
                balance.hashCode),
            alias.hashCode),
        idTitular.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccountModel')
          ..add('id', id)
          ..add('idUser', idUser)
          ..add('type', type)
          ..add('number', number)
          ..add('balance', balance)
          ..add('alias', alias)
          ..add('idTitular', idTitular))
        .toString();
  }
}

class AccountModelBuilder
    implements Builder<AccountModel, AccountModelBuilder> {
  _$AccountModel _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _idUser;
  int get idUser => _$this._idUser;
  set idUser(int idUser) => _$this._idUser = idUser;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  int _number;
  int get number => _$this._number;
  set number(int number) => _$this._number = number;

  double _balance;
  double get balance => _$this._balance;
  set balance(double balance) => _$this._balance = balance;

  String _alias;
  String get alias => _$this._alias;
  set alias(String alias) => _$this._alias = alias;

  int _idTitular;
  int get idTitular => _$this._idTitular;
  set idTitular(int idTitular) => _$this._idTitular = idTitular;

  AccountModelBuilder();

  AccountModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _idUser = _$v.idUser;
      _type = _$v.type;
      _number = _$v.number;
      _balance = _$v.balance;
      _alias = _$v.alias;
      _idTitular = _$v.idTitular;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AccountModel;
  }

  @override
  void update(void Function(AccountModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccountModel build() {
    final _$result = _$v ??
        new _$AccountModel._(
            id: id,
            idUser: idUser,
            type: type,
            number: number,
            balance: balance,
            alias: alias,
            idTitular: idTitular);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
