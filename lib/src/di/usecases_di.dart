import 'package:get_it/get_it.dart';
import 'package:tc_app/src/app/domains/usecases/auth_usecase.dart';

class UseCasesDI {
  const UseCasesDI._();

  static Future init(GetIt injector) async {
    injector.registerFactory<AuthUseCase>(() => AuthUseCase());
  }
}
