import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButtoms extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttomWidth;
  final double? buttomHeight;
  final String buttomText;
  final TextStyle buttomTextStyle;
  final VoidCallback onPressed;
  const AppTextButtoms(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      this.horizontalPadding,
      this.verticalPadding,
      this.buttomWidth,
      this.buttomHeight,
      required this.buttomText,
      required this.buttomTextStyle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius?? 16.0))),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor ??ColorsManager.mainBlue),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                  horizontal: horizontalPadding?.w ?? 12.w, vertical: verticalPadding?.h ??14.h)),
          minimumSize: MaterialStateProperty.all<Size>(
              Size(buttomWidth ??double.maxFinite, buttomHeight ?? 50.h))
      ),
        onPressed: onPressed, child: Text(buttomText, style: buttomTextStyle));
  }
}
