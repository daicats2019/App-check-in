import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class UserService {
  final Uri uri = Uri (
      scheme: 'https', host:'64a6b44d096b3f0fcc805ffd.mockapi.io'
  );

  static Future<List<UserModel>> getDataUserServer() async {
    var url = Uri(
      scheme: 'https',
      host: '64a6b44d096b3f0fcc805ffd.mockapi.io',
      path: '/check_in_app',
    );
    var respnse = await http.get(url);


    var listMap = jsonDecode(respnse.body) as List<dynamic>;
    List<UserModel> result = listMap.map((e) => UserModel.fromJson(e),).toList();
    return result;
  }
}