import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class UserService {
  final Uri uri = Uri (
      scheme: 'https', host:'bluemployees.online'
  );

  static Future<List<UserModel>> getDataUserServer() async {
    var url = Uri(
      scheme: 'https',
      host: 'bluemployees.online',
      path: '/api/v1/users',
    );
    var respnse = await http.get(url);
    print("${respnse}  okokokokko");

    var listMap = jsonDecode(respnse.body) as List<dynamic>;
    List<UserModel> result = listMap.map((e) => UserModel.fromJson(e),).toList();
    return result;
  }
}