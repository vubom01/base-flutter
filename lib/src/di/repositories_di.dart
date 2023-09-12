import 'package:get_it/get_it.dart';
import 'package:tc_app/src/app/data/repositories/auth_repository_impl.dart';
import 'package:tc_app/src/app/domains/repositories/auth_repository.dart';

class RepositoriesDI {
  const RepositoriesDI._();

  static Future init(GetIt injector) async {
    injector.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  }
}
