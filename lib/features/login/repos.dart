import 'package:flutter_complete_project/core/networking/api_result.dart';
import 'package:flutter_complete_project/core/networking/api_service.dart';
import 'package:flutter_complete_project/features/login/data/model/login_request_body.dart';
import 'package:flutter_complete_project/features/login/data/model/login_response.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);
  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    final response = await _apiService.login(loginRequestBody);
    try {
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
