import 'package:hive/hive.dart';
import 'package:hotel_app/database/model/user.dart';

class UserDao {
  final String boxName = 'user';

  UserDao._();

  Future<List<User>> where(bool Function(User element) predicable) async {
    final box = await Hive.openBox(boxName);
    List<User> result = box.values
        .where((element) => element is User ? predicable(element) : false)
        .map((e) => e as User).toList();

    await box.close();
    return result;
  }

  Future<User?> findOne(String username) async {
    final box = await Hive.openBox(boxName);
    User? user = box.get(username);
    await box.close();
    return user;
  }

  Future<bool> add(User user, {bool isReplaceOnDuplicated = false}) async {
    final box = await Hive.openBox(boxName);
    final isExisted = box.get(user.username) != null;
    if (!isReplaceOnDuplicated && isExisted) {
      return false;
    }
    box.put(user.username, user);
    await box.close();
    return true;
  }

  Future<List<User>> findAll() async {
    final box = await Hive.openBox(boxName);
    final List<User> list = [];
    var result = box.values;
    for (var element in result) {
      if (element is User) {
        list.add(element);
      }
    }
    box.close();
    return list;
  }

  factory UserDao.createNewInstance() {
    final isRegister = Hive.isAdapterRegistered(hiveUserType);
    if (!isRegister) {
      Hive.registerAdapter(UserAdapter());
    }
    return UserDao._();
  }
}
