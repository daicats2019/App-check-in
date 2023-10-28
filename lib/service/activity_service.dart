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

    final mockToken = "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE3Mjk0OTY5MjMsInVzZXJfaWQiOjEwLCJ1c2VybmFtZSI6InF1b2N2aWV0MTIzQGdtYWlsLmNvbSJ9.yAz2uItTmD5OmBwsbSmZap1LJX43zsW61zKbAf6e7iGxAJ_Oh_6PeSYBOB8fpbrqqpNDmDgVOebvEVdV0fBM8Q";

    dio.options.headers = {'Authorization': token};
    response = await dio.get('/api/v1/activities/today');
    print('DATA RESPONSE checkActivityToday OKOK:  $response');
    if (response.statusCode == 200 || response.statusCode == 201) {
      // return response.data as String;
      return ActivityModelToday.fromJson(jsonDecode(response.data));
    }
    return null;
  }
}
