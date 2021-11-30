import 'package:flutter/material.dart';
import 'package:java_spring_frontend/model/provider_model.dart';
import 'package:java_spring_frontend/screens/home_pages/sales_list.dart';
import 'package:java_spring_frontend/screens/login_pages/login_page.dart';
import 'package:java_spring_frontend/utilities/constands.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
      body: FridgeList(),
    );
  }
}
