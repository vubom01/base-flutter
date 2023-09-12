import 'package:flutter/material.dart';
import 'package:tc_app/src/core/app_states/states/main_state.dart';
import 'package:tc_app/src/core/l10n/generated/l10n.dart';
import 'package:tekflat_design/tekflat_design.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(TekSpacings().mainSpacing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TekButton(
            text: S.current.signIn,
            width: double.infinity,
            type: TekButtonType.outline,
            onPressed: () {
              MainState.to.setAccessToken("Demo token");
            },
          ),
        ],
      ),
    );
  }
}
