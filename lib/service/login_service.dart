import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class LoginService {
  static final dio = Dio(BaseOptions(baseUrl: baseUrl))
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

  static const String baseUrl = 'https://bluemployees.online';

  static Future<String?> login(String email, String password) async {
    Response response;
    response = await dio.post('/api/v1/login',
        data: {"email": email, "password": password});
    print('DATA RESPONSE: $response');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data as String;
    }
    return null;
  }
}
