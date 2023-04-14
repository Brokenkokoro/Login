import 'package:shared_preferences/shared_preferences.dart';

class TokenSimulator {
  static late SharedPreferences _simToken;

  static bool _existeToken = false;
  static String _user = '';
  static Future init() async {
    _simToken = await SharedPreferences.getInstance();
  }

  static bool get existeToken {
    return _simToken.getBool('existeToken') ?? _existeToken;
  }

  static set existeToken(bool value) {
    _existeToken = value;
    _simToken.setBool('existeToken', value);
  }

  static String get userToken {
    return _simToken.getString('UserToken') ?? _user;
  }

  static set userToken(String value) {
    _user = value;
    _simToken.setString('UserToken', value);
  }
}
