import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyles;
  final TextStyle? hintStyles;
  final String hintText;
  final bool? isObscureText;
  final Color? backGroundColor;
  final Widget? suffixIcon;
  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.inputTextStyles,
      this.hintStyles,
      required this.hintText,
      this.isObscureText,
      this.suffixIcon, this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(color: ColorsManager.mainBlue, width: 1.3)),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: ColorsManager.lighterGray,
                  width: 1.3,
                )),
        hintStyle: hintStyles ?? TextStyles.font13grayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backGroundColor ??ColorsManager.moreLightGray
      ),
      obscureText: isObscureText ?? true,
      style: inputTextStyles ?? TextStyles.font14darkBlueMedium,
    );
  }
}
