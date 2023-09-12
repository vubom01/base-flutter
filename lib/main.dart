import 'package:flutter/material.dart';

import 'runner/global_config.dart';
import 'src/my_app.dart';

void main() async {
  await GlobalConfig.initApp();
  runApp(const MyApp());
}
