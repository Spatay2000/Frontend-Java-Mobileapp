import 'package:flutter/material.dart';
import 'package:java_spring_frontend/screens/add_pages/add_pages.dart';
import 'package:java_spring_frontend/screens/chat_pages/chat_page.dart';

import 'package:java_spring_frontend/screens/login_pages/register_page.dart';
import 'package:java_spring_frontend/screens/login_pages/welcome_pages.dart';
import 'package:provider/provider.dart';

import 'model/provider_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      ),
    );
  }
}
