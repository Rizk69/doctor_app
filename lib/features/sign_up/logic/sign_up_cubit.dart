import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_project/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:flutter_complete_project/features/sign_up/data/repos/repos.dart';
import 'package:flutter_complete_project/features/sign_up/logic/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  void emitLoginState() async {
    emit(const SignUpState.loading());
    final response = await _signUpRepo.signUp(SignUpRequestBody(
      0,
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      phone: phoneController.text,
      passwordConfirmation: passwordConfirmationController.text,
    ));
    response.when(success: (data) {
      emit(SignUpState.loaded(data));
    }, error: (message) {
      emit(SignUpState.error(message: message));
    });
  }
}
