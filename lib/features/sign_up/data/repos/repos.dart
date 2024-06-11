import 'package:flutter_complete_project/core/networking/api_result.dart';
import 'package:flutter_complete_project/core/networking/api_service.dart';
import 'package:flutter_complete_project/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:flutter_complete_project/features/sign_up/data/model/sign_up_response.dart';

class SignUpRepo {
  final ApiService _apiService;
  SignUpRepo(this._apiService);
  Future<ApiResult<SignUpResponse>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    final response = await _apiService.signUp(signUpRequestBody);
    try {
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
