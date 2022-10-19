import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;
  static const _keyUserId = 'userId';
  static const _keyIslogedIn = 'islogedin';
  static const _keyState = 'state';
  static const _keyDistrict = 'district';
  static const _keyPincode = 'pincode';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUserId(String userId) async =>
      await _preferences!.setString(_keyUserId, userId);

  static String? getUserId() => _preferences!.getString(_keyUserId);

  static Future setLogin(String isLogin) async =>
      await _preferences!.setString(_keyIslogedIn, isLogin);

  static String? getLogin() => _preferences!.getString(_keyIslogedIn);

  static Future setState(String state) async =>
      await _preferences!.setString(_keyState, state);

  static String? getState() => _preferences!.getString(_keyState);

  static Future setDistrict(String district) async =>
      await _preferences!.setString(_keyDistrict, district);
  
  static String? getDistrict() => _preferences!.getString(_keyDistrict);

  static Future setPincode(String pincode) async =>
      await _preferences!.setString(_keyPincode, pincode);
  
  static String? getPincode() => _preferences!.getString(_keyPincode);

}
