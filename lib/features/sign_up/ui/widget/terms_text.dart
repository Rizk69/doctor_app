import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'By logging, you agree to our ',style:TextStyles.font13grayRegular ),
          TextSpan(text: 'Terms & Conditions ',style:TextStyles.font13darkBlueMedium ),
          TextSpan(text: 'and ',style:TextStyles.font13grayRegular.copyWith(height: 1.5) ),
          TextSpan(text: 'PrivacyPolicy.',style:TextStyles.font13darkBlueMedium )
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
