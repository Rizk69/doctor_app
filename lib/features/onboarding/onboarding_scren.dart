import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/onboarding/widget/doc_logo_and_name.dart';
import 'package:flutter_complete_project/features/onboarding/widget/doctor_image_text.dart';
import 'package:flutter_complete_project/features/onboarding/widget/get_started_buttom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            children: [
              const DocLogoAndName(),
              SizedBox(
                height: 30.h,
              ),
              DoctorImageAndText(),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Text(
                      'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                      style: TextStyles.font13grayRegular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.h,),
                    GetStartedButtom()
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
