import 'package:java_spring_frontend/model/shop_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';

class ShopService {
  Future<List<ShopModel>> getSales() async {
    http.Response response = await http.get(
      Uri.parse('http://192.168.1.3:9088/shopaddress/all'),
    );
    log("${response.statusCode}");

    if (response.statusCode == 200) {
      print(response.statusCode);
      log('${response.body}');
      // List<SalesModel> list =

      return (json.decode(response.body) as List)
          .map((data) => ShopModel.fromJson(data))
          .toList();
    } else {
      print(response.statusCode);
      throw Exception("${response.reasonPhrase}");
    }
  }
}
