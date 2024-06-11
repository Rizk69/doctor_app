import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/app_regex.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/widget/app_text_form_field.dart';
import 'package:flutter_complete_project/features/login/ui/widget/password_validation_text.dart';
import 'package:flutter_complete_project/features/sign_up/logic/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumbers = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowercase(passwordController.text);
        hasUppercase = AppRegex.hasUppercase(passwordController.text);
        hasNumbers = AppRegex.hasNumbers(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacters(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignUpCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'Name',
              controller: context.read<SignUpCubit>().nameController,
              validator: (value) {
                if (value == null ) {
                  return 'please enter valid name';
                }
              },
            ),
            verticalSpace(18),

            AppTextFormField(
              hintText: 'Phone Number',
              controller: context.read<SignUpCubit>().phoneController,
              validator: (value) {
                if (value == null || !AppRegex.isPhoneNumber(value)) {
                  return 'please enter valid phone number';
                }
              },
            ),
            verticalSpace(18),

            AppTextFormField(
              hintText: 'Email',
              controller: context.read<SignUpCubit>().emailController,
              validator: (value) {
                if (value == null || !AppRegex.isEmail(value)) {
                  return 'please enter valid email';
                }
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              hintText: 'Password',
              controller: context.read<SignUpCubit>().passwordController,
              validator: (value) {
                if (value == null || !AppRegex.isPassword(value)) {
                  return 'please enter valid password';
                }
              },
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                    isObscureText ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            verticalSpace(18),
            AppTextFormField(
              hintText: 'Password Confirmation',
              controller: context.read<SignUpCubit>().passwordConfirmationController,
              validator: (value) {
                if (value == null || !AppRegex.isPassword(value)) {
                  return 'please enter valid password';
                }
              },
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                    isObscureText ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            verticalSpace(25),
            PasswordValidationText(
              hasLowercase: hasLowercase,
              hasUppercase: hasUppercase,
              hasNumbers: hasNumbers,
              hasSpecialCharacters: hasSpecialCharacters,
              hasMinLength: hasMinLength,
            ),
          ],
        ));
  }
}
