import 'package:flutter/material.dart';
import 'package:tc_app/src/core/l10n/generated/l10n.dart';
import 'package:tekflat_design/tekflat_design.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TekTypography(
        text: S.current.profile,
      ),
    );
  }
}
