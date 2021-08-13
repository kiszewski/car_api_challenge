import 'package:car_api_challenge/app/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class LoginRepository {
  final Database db;

  LoginRepository(this.db);

  Future<bool> login(String username, String password) async {
    final maps = await db.query('users',
        where: 'username = $username AND password = $password');

    return maps.length > 0;
  }

  Future signUp(UserModel user) async {
    final result = await db.insert('users', user.toJson());
  }
}
