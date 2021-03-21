// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountDbAdapter extends TypeAdapter<AccountDb> {
  @override
  final int typeId = 1;

  @override
  AccountDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountDb(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      fields[3] as int,
      fields[4] as double,
      fields[5] as String,
      fields[6] as int,
      fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AccountDb obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idUser)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.balance)
      ..writeByte(5)
      ..write(obj.alias)
      ..writeByte(6)
      ..write(obj.idTitular)
      ..writeByte(7)
      ..write(obj.bank);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
