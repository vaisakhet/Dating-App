import 'package:shared_preferences/shared_preferences.dart';

const asToken = "accesss";
const reToken = "refresh";
const kUserList = "UserList";
const kEmail = "Email";
const kDomain = "Domain";
const kPassword = "Password";
const kThemeMode = "ThemeMode";
const kUserNameList = "UserNameList";
const kUserImageList = "UserImageList";
const kDateTime = "DateTime";

class SharedPrefResponse {
  static SharedPreferences? _prefns;
  static SharedPrefResponse? _instance;

  SharedPrefResponse._(SharedPreferences prefs) {
    _prefns = prefs;
  }

  static Future<void> initialize() async {
    _instance ??= SharedPrefResponse._(await SharedPreferences.getInstance());
  }

  static SharedPrefResponse get instance => _instance!;

  /// Set Access Token
  void SetAcessToken(String accessToken) {
    _prefns!.setString(asToken, accessToken);
  }

  /// Set Refresh Token
  void SetRefreshToken(String refreshToken) {
    _prefns!.setString(reToken, refreshToken);
  }

  void setUserList(List<String> data) {
    _prefns!.setStringList(kUserList, data);
  }

  void setEmail(String email) {
    _prefns!.setString(kEmail, email);
  }

  void setDomain(String domain) {
    _prefns!.setString(kDomain, domain);
  }

  void setPassword(String password) {
    _prefns!.setString(kPassword, password);
  }

  // void setThemeMode(ThemeMode themeMode) {
  //   _prefns!.setInt(kThemeMode, themeMode.index);
  // }

  void setUserNameList(List<String> usersName) {
    _prefns!.setStringList(kUserNameList, usersName);
  }

  void setUserImageList(List<String> userImage) {
    _prefns!.setStringList(kUserImageList, userImage);
  }

  void setDateTime(List<String> dateTime) {
    _prefns!.setStringList(kDateTime, dateTime);
  }

  /// Sign Out clrear All Data

  void signOut() {
    // _prefns!.clear();
    _prefns!.remove(asToken);
    _prefns!.remove(reToken);
    _prefns!.remove(kUserList);
    _prefns!.remove(kEmail);
    _prefns!.remove(kDomain);
    _prefns!.remove(kPassword);
  }

  String? get getAccessToken {
    return _prefns!.getString(asToken);
  }

  String get getRefreshToken {
    return _prefns!.getString(reToken)!;
  }

  List<String>? get getUserList {
    return _prefns!.getStringList(kUserList)!;
  }

  String? get getEmail {
    return _prefns!.getString(kEmail);
  }

  String? get getDomain {
    return _prefns!.getString(kDomain);
  }

  String? get getPassword {
    return _prefns!.getString(kPassword);
  }

  // ThemeMode getThemeMode() {
  //   final int? index = _prefns!.getInt(kThemeMode);
  //   return index != null ? ThemeMode.values[index] : ThemeMode.system;
  // }

  List<String>? get getUserNameList {
    return _prefns!.getStringList(kUserNameList);
  }

  List<String>? get getUserImageList {
    return _prefns!.getStringList(kUserImageList);
  }
}
