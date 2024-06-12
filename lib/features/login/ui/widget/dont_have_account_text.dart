import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Don\'t have an account yet?',
                style: TextStyles.font13darkBlueRegular),
            const TextSpan(text: ' '),
            TextSpan(
                text: 'Sign Up ',
                style: TextStyles.font13BlueSemiBold,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.pushNamed(Routes.signUpScreen);
                  })
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
