import 'package:flutter/material.dart';

import '../controller.dart';
import '../widgets/widgets.dart';

class RootLayoutMobile extends StatelessWidget {
  const RootLayoutMobile({
    super.key,
    required this.child,
    required this.controller,
  });

  final Widget child;
  final RootController controller;

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        key: controller.globalKeyRootPage,
        body: Column(
          children: [
            Expanded(child: child),
            const BottomNavigationBarWidget(),
          ],
        ),
      );
}
