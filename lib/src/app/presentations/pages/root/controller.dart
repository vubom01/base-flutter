import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tc_app/src/core/state_management/base_controller.dart';

import 'state.dart';

class RootController extends BaseController {
  static RootController get to => Get.find<RootController>();
  final GlobalKey globalKeyRootPage = GlobalKey<ScaffoldState>();

  final RootState state = RootState();

  @override
  void init() async {
    try {
      await syncData();
      state.setIsLoadingInitApp(true);
    } catch (e) {
      state.setIsLoadingInitApp(false);
    }
  }

  @override
  void dispose() {
    state.setIsLoadingInitApp(false);
  }

  Future syncData() => Future.wait([]);
}
