import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ActivityService {
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

  static Future<String?> checkActivityToday(String email, String password) async {
    Response response;
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    response = await dio.get('/api/v1/activity/today');
    print('DATA RESPONSE: $response');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data as String;
    }
    return null;
  }
}
