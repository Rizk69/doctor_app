import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widget/app_text_buttoms.dart';
import 'package:flutter_complete_project/features/login/data/model/login_request_body.dart';
import 'package:flutter_complete_project/features/login/ui/widget/already_have_account_text.dart';
import 'package:flutter_complete_project/features/login/ui/widget/email_and_password.dart';
import 'package:flutter_complete_project/features/login/ui/widget/login_bloc_listener.dart';
import 'package:flutter_complete_project/features/login/ui/widget/terms_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password?',
                        style: TextStyles.font13BlueRegular)),
                verticalSpace(41),

                AppTextButtoms(buttomText: 'Login',onPressed: (){
                  validateThenLogin(context);
                }, buttomTextStyle:TextStyles.font16WhiteSemiBold,),
                verticalSpace(16),

                TermsAndConditionsText(),
                verticalSpace(60),

                AlreadyHaveAccountText(),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if(context.read<LoginCubit>().formKey.currentState!.validate()){
      context.read<LoginCubit>().emitLoginState(LoginRequestBody(email: context.read<LoginCubit>().emailController.text, password: context.read<LoginCubit>().passwordController.text));
  }
}}
