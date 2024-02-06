import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/shared_preferences.dart';
import 'services/base_service.dart';

final singleton = GetIt.instance;
//
Future<void> setup() async {
  final _prefs = await SharedPreferences.getInstance();
  singleton.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(prefs: _prefs),
  );
  singleton.registerSingleton<DioClient>(DioClient());
}
