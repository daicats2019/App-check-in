import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../model/aciviity_today_model.dart';

class ActivityActionService {
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

  static Future<ActivityModelToday?> checkActivityAction(
    bool isCheckIn, String token) async {
    Response response;

    dio.options.headers = {'Authorization': token};
    response = await dio.put('/api/v1/activities/action',
        data: { "is_check_in": isCheckIn});
    print('DATA RESPONSE checkActivityAction OKOK2:  $response');
    if (response.statusCode == 200 || response.statusCode == 201) {
      // return response.data as String;
      return ActivityModelToday.fromJson(response.data);
    }
    return null;
  }
}
