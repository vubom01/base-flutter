import 'package:get_it/get_it.dart';
import 'package:tc_app/src/core/app_states/states/language_state.dart';
import 'package:tc_app/src/core/app_states/states/main_state.dart';
import 'package:tc_app/src/core/app_states/states/theme_state.dart';
import 'package:tc_app/src/core/app_states/states_impl/language_state_impl.dart';
import 'package:tc_app/src/core/app_states/states_impl/main_state_impl.dart';
import 'package:tc_app/src/core/app_states/states_impl/theme_state_impl.dart';

class AppStatesDI {
  const AppStatesDI._();

  static Future init(GetIt injector) async {
    injector.registerSingleton<LanguageState>(LanguageStateImpl().init());
    injector.registerSingleton<ThemeState>(ThemeStateImpl().init());
    injector.registerSingleton<MainState>(MainStateImpl().init());
  }
}
