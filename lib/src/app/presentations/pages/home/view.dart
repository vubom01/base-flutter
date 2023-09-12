import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tc_app/src/core/app_states/states/main_state.dart';
import 'package:tc_app/src/core/l10n/generated/l10n.dart';
import 'package:tekflat_design/tekflat_design.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(TekSpacings().mainSpacing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TekTypography(text: MainState.to.user?.email ?? 'No user'),
          TekVSpace.mainSpace,
          TekButton(
            text: S.current.logout,
            width: double.infinity,
            type: TekButtonType.outline,
            iconData: FontAwesomeIcons.rightFromBracket,
            iconIsRight: true,
            onPressed: () {
              MainState.to.logout();
            },
          ),
        ],
      ),
    );
  }
}
