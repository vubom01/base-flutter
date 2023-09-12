import 'package:go_router/go_router.dart';
import 'package:tc_app/src/di/app_injector.dart';

import 'app_routes.dart';

abstract class AppRouter {
  static AppRouter get to => AppInjector.injector<AppRouter>();

  AppRouter init();

  GoRouter get router;

  AppRoutes? get currentAppRoutes;
}
