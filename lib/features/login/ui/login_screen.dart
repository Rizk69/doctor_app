import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widget/app_text_buttoms.dart';
import 'package:flutter_complete_project/core/widget/app_text_form_field.dart';
import 'package:flutter_complete_project/features/login/ui/widget/already_have_account_text.dart';
import 'package:flutter_complete_project/features/login/ui/widget/email_and_password.dart';
import 'package:flutter_complete_project/features/login/ui/widget/terms_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(30),

                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14grayRegular,
                ),
                verticalSpace(40),
                EmailAndPassword(),
                verticalSpace(25),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password?',
                        style: TextStyles.font13BlueRegular)),
                verticalSpace(41),

                AppTextButtoms(buttomText: 'Login',onPressed: (){}, buttomTextStyle:TextStyles.font16WhiteSemiBold,),
                verticalSpace(16),

                TermsAndConditionsText(),
                verticalSpace(60),

                AlreadyHaveAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
