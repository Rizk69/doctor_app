import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/font_wieght_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle font24Black700W = TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: Colors.black);

  static TextStyle font32BlueBold = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.mainBlue);
  static TextStyle font24BlueBold = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.mainBlue);
  static TextStyle font13grayRegular = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.gray);
  static TextStyle font14grayRegular = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.gray);
  static TextStyle font13darkBlueRegular = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.darkBlue);
  static TextStyle font13darkBlueMedium = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManager.darkBlue);
  static TextStyle font14lightGrayRegular = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.lightGray);
  static TextStyle font13BlueRegular = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.mainBlue);
  static TextStyle font14darkBlueMedium = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManager.darkBlue);
  static TextStyle font16WhiteSemiBold = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: Colors.white);
  static TextStyle font13BlueSemiBold = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: ColorsManager.mainBlue);
}
