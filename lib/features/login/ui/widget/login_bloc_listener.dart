import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/login/logic/login_cubit.dart';
import 'package:flutter_complete_project/features/login/logic/login_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Error || current is Loaded,
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),

              );
            },
          );
        }, error: (message) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: const Icon(Icons.error,color: Colors.red,size: 32,),
                title: const Text('Error'),
                content: Text(message,style:TextStyles.font13darkBlueMedium.copyWith(color: ColorsManager.darkBlue)),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child:  Text('OK',style: TextStyles.font13BlueSemiBold.copyWith(fontSize: 14.sp),),
                  )
                ],
              );
            },
          );
        }, loaded: (data) {
          context.pop;

          context.pushNamed(Routes.homeScreen);
        });
      },
      child: SizedBox.shrink(),
    );
  }
}
