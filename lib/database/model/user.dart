import 'package:hive/hive.dart';

part 'user.g.dart'; // Generated file for TypeAdapter

const int hiveUserType = 0;

@HiveType(typeId: hiveUserType)
class User extends HiveObject {
  @HiveField(0)
  late String username;

  @HiveField(1)
  late String email;

  @HiveField(2)
  late String password;

  User({
    required this.username,
    required this.email,
    required this.password,
  });
}