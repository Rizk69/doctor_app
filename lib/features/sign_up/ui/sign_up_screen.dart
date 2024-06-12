import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widget/app_text_buttoms.dart';
import 'package:flutter_complete_project/features/login/ui/widget/dont_have_account_text.dart';
import 'package:flutter_complete_project/features/login/ui/widget/login_bloc_listener.dart';
import 'package:flutter_complete_project/features/login/ui/widget/terms_text.dart';
import 'package:flutter_complete_project/features/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter_complete_project/features/sign_up/ui/widget/already_have_account_text.dart';
import 'package:flutter_complete_project/features/sign_up/ui/widget/signUp_bloc_listener.dart';
import 'package:flutter_complete_project/features/sign_up/ui/widget/signUp_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14grayRegular,
                ),
                verticalSpace(40),
                SignUpForm(),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password?',
                        style: TextStyles.font13BlueRegular)),
                verticalSpace(41),
                AppTextButtoms(
                  buttomText: 'Sign Up',
                  onPressed: () {
                    validateThenSignUp(context);
                  },
                  buttomTextStyle: TextStyles.font16WhiteSemiBold,
                ),
                verticalSpace(16),
                TermsAndConditionsText(),
                verticalSpace(40),
                AlreadyHaveAccountText(),
                const SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitLoginState();
    }
  }
}
