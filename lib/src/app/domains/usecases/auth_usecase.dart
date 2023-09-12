import 'package:tc_app/src/di/app_injector.dart';

class AuthUseCase {
  static AuthUseCase get to => AppInjector.injector<AuthUseCase>();
}
