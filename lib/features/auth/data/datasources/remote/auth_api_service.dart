import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/auth_response.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('v1/users/login/firebase/')
  Future<AuthResponse> login(
      @Body() Map<String, dynamic> body,
      );
}