import 'package:hive/hive.dart';

part 'user_db.g.dart';

@HiveType(typeId: 0)
class UserDb {
  @HiveField(0)
  String name;

  UserDb([this.name]);

}