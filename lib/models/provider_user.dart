import 'dart:collection';
import 'package:flutter/material.dart';
import 'user_models.dart';

class ProviderUser extends ChangeNotifier {
  final List<User> _users = [];

  UnmodifiableListView<User> get users => UnmodifiableListView(_users);

  int get userCount {
    return _users.length;
  }

  void addUser(User newUser) {
    _users.add(newUser);
    notifyListeners();
  }

  void deleteUser(){
    _users.clear();
    notifyListeners();
  }
}
