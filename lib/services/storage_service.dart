import 'package:shared_preferences/shared_preferences.dart';

const storageKeyAuth = "auth";

class StorageService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> save(String data) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(storageKeyAuth, data);
  }

  Future<String?> getData() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(storageKeyAuth);
  }
}
