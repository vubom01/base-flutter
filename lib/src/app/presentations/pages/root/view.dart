import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tc_app/src/app/presentations/widgets/loading.dart';
import 'package:tc_app/src/core/state_management/state_management.dart';
import 'package:tekflat_design/tekflat_design.dart';

import 'controller.dart';
import 'keys.dart';
import 'layouts/layouts.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => BaseViewController<RootController>(
        controller: RootController(),
        pageBuilder: (baseContext, controller) {
          return Obx(
            () {
              if (!controller.state.isLoadingInitApp) {
                return const AppLoadingWidget();
              }
              return TekResponsive.appResBuilder(
                TekResponsive.resBuilder(
                  key: RootPageKeys.rootPageResBuilderKey.valueKey,
                  children: RootLayoutMobile(
                    controller: controller,
                    child: child,
                  ),

                  /// TODO : Add more layout
                ),
                key: RootPageKeys.rootPageKey.valueKey,
              );
            },
          );
        },
      );
}
