import 'package:get_it/get_it.dart';
import 'package:tc_app/src/core/router/router.dart';

class RouterDI {
  const RouterDI._();

  static Future init(GetIt injector) async {
    injector.registerSingleton<AppRouter>(AppRouterImpl().init());
  }
}
