import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'Already have an account yet?',style:TextStyles.font13darkBlueRegular ),
          const TextSpan(text: ' '),
          TextSpan(text: 'Sign Up ',style:TextStyles.font13BlueSemiBold )
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
