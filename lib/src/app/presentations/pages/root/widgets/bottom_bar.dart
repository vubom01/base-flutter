import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tc_app/src/core/l10n/generated/l10n.dart';
import 'package:tc_app/src/core/router/router.dart';
import 'package:tekflat_design/tekflat_design.dart';

import '../models.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final List<MenuItemModel> _menuItemModels = [
    MenuItemModel(
      title: S.current.home,
      icon: FontAwesomeIcons.house,
      route: AppRoutes.home,
    ),
    MenuItemModel(
      title: S.current.plan,
      icon: FontAwesomeIcons.solidCalendarCheck,
      route: AppRoutes.plan,
    ),
    MenuItemModel(
      title: S.current.wishList,
      icon: FontAwesomeIcons.solidHeart,
      route: AppRoutes.wishList,
    ),
    MenuItemModel(
      title: S.current.profile,
      icon: FontAwesomeIcons.solidUser,
      route: AppRoutes.profile,
    ),
  ];

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
    context.goNamed(_menuItemModels[index].route.name);
  }

  @override
  Widget build(BuildContext context) => Container(
        height: 85,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _menuItemModels
              .map(
                (e) => Expanded(
                  child: TekButtonInkwell(
                    onPressed: () => _onItemTapped(_menuItemModels.indexOf(e)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          e.icon,
                          color: _currentIndex == _menuItemModels.indexOf(e)
                              ? TekColors().primary
                              : TekColors.greyOpacity06,
                          size: TekFontSizes().s24,
                        ),
                        TekVSpace.p4,
                        Text(
                          e.title,
                          style: TekTextStyles.body.copyWith(
                            color: _currentIndex == _menuItemModels.indexOf(e)
                                ? TekColors().primary
                                : TekColors.greyOpacity06,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      );
}
