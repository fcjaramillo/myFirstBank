import 'package:hive/hive.dart';

part 'account_db.g.dart';

@HiveType(typeId: 1)
class AccountDb {

  @HiveField(0)
  int id;

  @HiveField(1)
  int idUser;

  @HiveField(2)
  String type;

  @HiveField(3)
  int number;

  @HiveField(4)
  double balance;

  @HiveField(5)
  String alias;

  @HiveField(6)
  int idTitular;

  @HiveField(7)
  String bank;

  AccountDb([this.id, this.idUser, this.type, this.number, this.balance, this.alias, this.idTitular, this.bank]);
}