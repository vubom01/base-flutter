import 'package:flutter/material.dart';
import 'package:tc_app/src/core/l10n/generated/l10n.dart';
import 'package:tekflat_design/tekflat_design.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TekTypography(
        text: S.current.plan,
      ),
    );
  }
}
