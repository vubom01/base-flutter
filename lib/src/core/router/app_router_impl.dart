import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tc_app/src/app/presentations/pages/home/home.dart';
import 'package:tc_app/src/app/presentations/pages/plan/plan.dart';
import 'package:tc_app/src/app/presentations/pages/profile/profile.dart';
import 'package:tc_app/src/app/presentations/pages/root/root.dart';
import 'package:tc_app/src/app/presentations/pages/sign_in/sign_in.dart';
import 'package:tc_app/src/app/presentations/pages/wish_list/wish_list.dart';
import 'package:tc_app/src/core/app_states/states/language_state.dart';
import 'package:tc_app/src/core/app_states/states/main_state.dart';
import 'package:tc_app/src/core/app_states/states/theme_state.dart';
import 'package:tekflat_design/tekflat_design.dart';

import 'app_router.dart';
import 'app_routes.dart';

class AppRouterKeys {
  const AppRouterKeys._();

  static const ValueKey<String> $signInKey = ValueKey<String>('APP_ROUTER_SIGN_IN_KEY');

  static const ValueKey<String> $rootKey = ValueKey<String>('APP_ROUTER_ROOT_KEY');

  static const ValueKey<String> $homeKey = ValueKey<String>('APP_ROUTER_HOME_KEY');

  static const ValueKey<String> $planKey = ValueKey<String>('APP_ROUTER_PLAN_KEY');

  static const ValueKey<String> $wishListKey = ValueKey<String>('APP_ROUTER_WISH_LIST_KEY');

  static const ValueKey<String> $profileKey = ValueKey<String>('APP_ROUTER_PROFILE_KEY');
}

class AppRouterImpl extends AppRouter {
  AppRoutes? _currentRoute;
  late final GoRouter _router;

  @override
  AppRouterImpl init() {
    _router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: AppRoutes.home.path,
      redirect: (context, state) {
        _currentRoute = AppRoutes.getRouteFromString(state.matchedLocation);
        if (!MainState.to.isLogin && (state.uri.toString() == AppRoutes.signIn.path)) return null;
        if (!MainState.to.isLogin) return AppRoutes.signIn.path;
        if (state.uri.toString() == AppRoutes.signIn.path) return AppRoutes.home.path;
        return null;
      },
      refreshListenable: Listenable.merge(
        [
          MainState.to,
          LanguageState.to,
          ThemeState.to,
        ],
      ),
      routes: [
        GoRoute(
          path: AppRoutes.signIn.path,
          name: AppRoutes.signIn.name,
          builder: (_, __) => const SignInPage(key: AppRouterKeys.$signInKey),
        ),
        ShellRoute(
          builder: (_, GoRouterState state, Widget child) => RootPage(
            key: AppRouterKeys.$rootKey,
            child: child,
          ),
          routes: [
            GoRoute(
              path: AppRoutes.home.path,
              name: AppRoutes.home.name,
              builder: (context, state) => const HomePage(key: AppRouterKeys.$homeKey),
            ),
            GoRoute(
              path: AppRoutes.plan.path,
              name: AppRoutes.plan.name,
              builder: (context, state) => const PlanPage(key: AppRouterKeys.$planKey),
            ),
            GoRoute(
              path: AppRoutes.wishList.path,
              name: AppRoutes.wishList.name,
              builder: (context, state) => const WishListPage(key: AppRouterKeys.$wishListKey),
            ),
            GoRoute(
              path: AppRoutes.profile.path,
              name: AppRoutes.profile.name,
              builder: (context, state) => const ProfilePage(key: AppRouterKeys.$profileKey),
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) {
        /// TODO handle others error
        return const Center(
          child: TekTypography(
            text: 'GoRouter errorBuilder',
          ),
        );
      },
    );
    return this;
  }

  @override
  GoRouter get router => _router;

  @override
  AppRoutes? get currentAppRoutes => _currentRoute;
}
