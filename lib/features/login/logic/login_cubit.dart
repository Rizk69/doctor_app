import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_project/features/login/data/model/login_request_body.dart';
import 'package:flutter_complete_project/features/login/logic/login_state.dart';
import 'package:flutter_complete_project/features/login/repos.dart';




class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginState(LoginRequestBody loginRequestBody) async{
    emit(const LoginState.loading());
   final response=await _loginRepo.login(loginRequestBody);
   response.when(
     success: (data) {
       emit(LoginState.loaded(data));
     },
     error: (message) {
       emit(LoginState.error(message: message));
     }
   );
  }
}
