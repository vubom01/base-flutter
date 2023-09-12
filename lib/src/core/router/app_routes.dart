import 'package:collection/collection.dart';
import 'package:tc_app/src/core/l10n/generated/l10n.dart';

enum AppRoutes {
  signIn('/sign-in'),
  home('/home'),
  plan('/plan'),
  wishList('/wish-list'),
  profile('/profile'),
  ;

  final String path;

  const AppRoutes(this.path);

  String get nameOfRoute {
    switch (this) {
      case AppRoutes.signIn:
        return S.current.signIn;

      case AppRoutes.home:
        return S.current.home;
      case AppRoutes.plan:
        return S.current.plan;
      case AppRoutes.wishList:
        return S.current.wishList;
      case AppRoutes.profile:
        return S.current.profile;
    }
  }

  String get routerKey => 'APP_ROUTE_$name';

  static AppRoutes? getRouteFromString(String name) =>
      AppRoutes.values.firstWhereOrNull((element) => element.name == name);
}
