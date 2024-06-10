import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/app_regex.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/widget/app_text_form_field.dart';
import 'package:flutter_complete_project/features/login/logic/login_cubit.dart';
import 'package:flutter_complete_project/features/login/ui/widget/password_validation_text.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({Key? key}) : super(key: key);

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
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
    passwordController = context
        .read<LoginCubit>()
        .passwordController;
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
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'Email',
              controller: context
                  .read<LoginCubit>()
                  .emailController,
              validator: (value) {
                if (value!.isEmpty || value == null || !AppRegex.isEmail(value)) {
                  return 'please enter valid email';
                }
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              hintText: 'Password',

              controller: context
                  .read<LoginCubit>()
                  .passwordController,
              validator: (value) {
                if (value!.isEmpty || value == null) {
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
                child:
                Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
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
