import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefsLocalDataSource implements AuthLocalDataSource {
  @override
  Future<String> getToken() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(CacheConstant.token)!;
    } catch (e) {
      throw LocalException(message: 'Failed to Get Token');
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(CacheConstant.token, token);
    } catch (e) {
      throw LocalException(message: 'Failed to Save Token');
    }
  }
}
