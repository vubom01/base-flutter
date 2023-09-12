import 'package:flutter/material.dart';
import 'package:tekflat_design/tekflat_design.dart';

class FormItemWidget extends StatelessWidget {
  const FormItemWidget({
    Key? key,
    required this.title,
    this.heightSpace,
    required this.child,
    this.isRequired = false,
    this.type,
    this.fontWeight,
    this.titleColor,
  }) : super(key: key);

  final String title;
  final double? heightSpace;
  final Widget child;
  final bool isRequired;
  final TekTypographyType? type;
  final FontWeight? fontWeight;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(
              bottom: heightSpace ?? TekSpacings().p4,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                TekTypography(
                  text: title,
                  type: type ?? TekTypographyType.level5,
                  fontWeight: fontWeight,
                  color: titleColor,
                ),
                if (isRequired)
                  const Positioned(
                    top: 0,
                    right: -15,
                    child: TekTypography(
                      text: "*",
                      type: TekTypographyType.level4,
                      fontWeight: FontWeight.w600,
                      color: TekColors.red,
                    ),
                  ),
              ],
            ),
          ),
        child,
      ],
    );
  }
}
