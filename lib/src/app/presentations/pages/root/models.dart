import 'package:flutter/material.dart';
import 'package:tc_app/src/core/router/router.dart';

class MenuItemModel {
  final String title;
  final IconData icon;
  final AppRoutes route;

  MenuItemModel({
    required this.title,
    required this.icon,
    required this.route,
  });
}
