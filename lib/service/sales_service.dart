import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:java_spring_frontend/model/sales_product_model.dart';
import 'package:java_spring_frontend/screens/home_pages/home_page.dart';

class SalesService {
  Future<List<SalesModel>> getSales() async {
    http.Response response = await http.get(
      Uri.parse('http://192.168.1.7:9091/sales/all'),
    );
    log("${response.statusCode}");

    if (response.statusCode == 200) {
      print(response.statusCode);
      log('${response.body}');
      // List<SalesModel> list =

      return (json.decode(response.body) as List)
          .map((data) => SalesModel.fromJson(data))
          .toList();
    } else {
      print(response.statusCode);
      throw Exception("${response.reasonPhrase}");
    }
  }

  Future<void> addSales(String name, String price, context) async {
    var headers = {"Content-Type": "application/json"};
    var body = jsonEncode({"value": "$price", "salesProduct": "$name"});
    http.Response response = await http.post(
        Uri.parse('http://192.168.1.7:9091/sales/create'),
        headers: headers,
        body: body);

    if (response.statusCode == 200) {
      print(response.statusCode);
      log('${response.body}');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print(response.statusCode);
    }
  }

  Future<void> changeSales(
      String id, String name, String price, context) async {
    var headers = {"Content-Type": "application/json"};
    var body =
        jsonEncode({"id": "$id", "value": "$price", "salesProduct": "$name"});
    http.Response response = await http.post(
        Uri.parse('http://192.168.1.7:9091/sales/update'),
        headers: headers,
        body: body);

    if (response.statusCode == 200) {
      print(response.statusCode);
      log('${response.body}');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print(response.statusCode);
    }
  }
}
