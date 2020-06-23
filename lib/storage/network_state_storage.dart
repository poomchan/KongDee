import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/model/user.dart';

class NetworkStateStorage extends ChangeNotifier {
  User _currentUser;
  bool _isAuth;

  Map<String, String> _categoryMap = {
    'select category': 'select category',
    'Sod': 'Fish, Meat',
    'Hang': 'Moo Yorng',
    'Food': 'Papaya Salad',
    'Second Hand': 'Tires',
  };

  void setIsAuth(bool isAuth) {
    this._isAuth = isAuth;
  }

  void updateIsAuth(bool isAuth) {
    this._isAuth = isAuth;
    notifyListeners();
  }

  bool get isAuth {
    return _isAuth;
  }

  Map<String, String> get categoryMap => _categoryMap;

  List<String> get categoryList => _categoryMap.keys.toList();

  User get currentUser => _currentUser;

  setCurrentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  clear() {
    this._currentUser = null;
    notifyListeners();
  }
}
