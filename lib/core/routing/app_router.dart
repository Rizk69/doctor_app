import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/features/home/ui/screens/home_screen.dart';
import 'package:flutter_complete_project/features/login/logic/login_cubit.dart';
import 'package:flutter_complete_project/features/login/ui/login_screen.dart';
import 'package:flutter_complete_project/features/onboarding/onboarding_scren.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: LoginScreen(),
            ));
        case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) =>
            HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                  body: Center(
                    child: Text('No route defined foe ${settings.name}'),
                  ),
                ));
    }
  }
}
