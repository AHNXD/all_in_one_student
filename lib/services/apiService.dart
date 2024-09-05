// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static var ip = "http://ahnxdx-001-site1.atempurl.com/api/Student/";
  static String? token;
  //get
  static Future getUser({required String code}) async {
    final getUser = Uri.parse("${ip}Get?code=$code");
    final response = await http.get(getUser,
        headers: {HttpHeaders.authorizationHeader: "Bearer ${token!}"});
    return json.decode(response.body);
  }

  //post
  static Future userLogin(String code, String password) async {
    final loginUrl = Uri.parse("${ip}Login?code=$code&password=$password");
    final response = await http.post(loginUrl);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      token = jsonResponse['token'];
    } else {
      token = null;
    }
    return response.statusCode;
  }
}
