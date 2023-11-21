import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../model/aciviity_today_model.dart';

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

  static Future<ActivityModelToday?> checkActivityToday(String token) async {
    Response response;

    dio.options.headers = {'Authorization': token};
    response = await dio.get('/api/v1/activities/today');
    print('DATA RESPONSE checkActivityToday OKOK:  ${response}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      var result = response.data;
      return ActivityModelToday.fromJson(result);
    }
    return null;
  }
}
