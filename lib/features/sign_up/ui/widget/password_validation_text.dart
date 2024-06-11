import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class PasswordValidationText extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasNumbers;
  final bool hasSpecialCharacters;
  final bool hasMinLength;
  const PasswordValidationText(
      {super.key,
      required this.hasLowercase,
      required this.hasUppercase,
      required this.hasNumbers,
      required this.hasSpecialCharacters,
      required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
            hasLowercase, 'At least one lowercase character (a-z)'),
        verticalSpace(2),
        buildValidationRow(
            hasUppercase, 'At least one uppercase character (A-Z)'), verticalSpace(2),
        verticalSpace(2),

        buildValidationRow(
            hasSpecialCharacters, 'At least one Special Characters'), verticalSpace(2),
        verticalSpace(2),

        buildValidationRow(
            hasNumbers, 'At least one Numbers'),
        verticalSpace(2),

        buildValidationRow(
            hasMinLength, 'At least one Min Length'), verticalSpace(2),

      ],
    );
  }

  buildValidationRow(bool hasValidation, String text) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13darkBlueRegular.copyWith(
            decoration: hasValidation
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidation ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        )
      ],
    );
  }
}
