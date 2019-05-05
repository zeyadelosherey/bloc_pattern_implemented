import 'package:bloc_pattern_implemented/MODELs/User.dart';

class DbApi {
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 3));
    User _user = User('Zeyad', 19, 140.0);
    return _user;
  }
}

DbApi api = DbApi();