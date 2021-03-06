import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_employee/models/all_user.dart';
import 'package:flutter_employee/models/user_detail.dart';

class FetchData {
  static String baseUrl = 'https://reqres.in';
  static var client = http.Client();

  static Future<dynamic> getListUsers() async {
    var pathname = Uri.parse(baseUrl + '/api/users?page=2');
    var response = await client.get(pathname);

    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      return Exception();
    }
  }

  static Future<dynamic> getUserDetail({int? id}) async {
    var pathname = Uri.parse(baseUrl + '/api/users/$id');
    var response = await client.get(pathname);

    if (response.statusCode == 200) {
      return userDetailFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<dynamic> createUser({String? name, String? job}) async {
    var pathname = Uri.parse(baseUrl + '/api/users');
    var body = jsonEncode({'name': name.toString(), 'job': job.toString()});
    var response = await client.post(pathname,
        body: body, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
