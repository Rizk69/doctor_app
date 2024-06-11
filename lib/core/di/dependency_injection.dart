import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_service.dart';
import 'package:flutter_complete_project/core/networking/dio_factory.dart';
import 'package:flutter_complete_project/features/login/logic/login_cubit.dart';
import 'package:flutter_complete_project/features/login/data/repos/repos.dart';
import 'package:flutter_complete_project/features/sign_up/data/repos/repos.dart';
import 'package:flutter_complete_project/features/sign_up/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;

Future<void> setupDependencyInjection() async {
  //Dio & ApiService
  Dio dio =  DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() =>ApiService(dio) );

  //LoginRepo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() =>LoginCubit(getIt()));
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() =>SignUpCubit(getIt()));

}
