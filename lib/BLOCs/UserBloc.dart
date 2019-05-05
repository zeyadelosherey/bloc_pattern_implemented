import 'dart:async';
import 'package:bloc_pattern_implemented/APIs/UserApi.dart';
import 'package:bloc_pattern_implemented/MODELs/User.dart';
import 'package:bloc_pattern_implemented/UTILs/bloc_provider.dart';




class UserBloc implements BlocBase {
  User _user;

  // Streams to handle the user
  StreamController<User> _userController = StreamController<User>.broadcast();
  Sink<User> get _inUser => _userController.sink;
  Stream<User> get outUser => _userController.stream;

  UserBloc() {
    init();
  }

  void init() async {
    _user = await api.getUser();

    _inUser.add(_user);
  }

  @override
  void dispose() {
    _userController.close();
  }

  void updateUser(User user) {
    _user = user;
    _inUser.add(_user);
  }

  void updateName(String name) {
    _user.name = name+"   updated";
    _inUser.add(_user);
  }
}