import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('asset/images/svg/logo_onboarding.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.14, 0.4])),
          child: Image.asset('asset/images/doctor.png'),
        ),
        Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Text(
              'Best Doctor\n Appointment App',
              style: TextStyles.font32BlueBold.copyWith(height: 1.4),
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
