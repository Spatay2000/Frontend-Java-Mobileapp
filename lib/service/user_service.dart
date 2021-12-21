import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:java_spring_frontend/screens/home_pages/home_page.dart';
import 'package:java_spring_frontend/screens/home_pages/sales_list.dart';
import 'package:java_spring_frontend/screens/login_pages/login_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  // late String token;
  Future<void> loginByNumberAndPassword(
      String phoneNumber, String password, context) async {
    var headers = {"Content-Type": "application/json"};
    var body =
        jsonEncode({"username": "$phoneNumber", "password": "$password"});
    http.Response response = await http.post(
        Uri.parse('http://192.168.1.3:9099/auth/signin'),
        headers: headers,
        body: body);

    if (response.statusCode == 200) {
      print(response.statusCode);
      log('${response.body}');
      print('Logged in');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print(response.statusCode);
    }
  }

  Future<void> register(
      String username, String email, String password, context) async {
    var headers = {"Content-Type": "application/json"};
    var body = jsonEncode({
      "username": "$username",
      "email": "$email",
      "password": "$password",
      "role": "[user]"
    });
    http.Response response = await http.post(
        Uri.parse('http://192.168.1.3:9099/auth/signup'),
        headers: headers,
        body: body);

    if (response.statusCode == 200) {
      print(response.statusCode);
      log('${response.body}');
      print('Logged in');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      print(response.statusCode);
    }
  }
}
