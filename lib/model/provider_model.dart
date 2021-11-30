import 'package:flutter/material.dart';
import 'package:java_spring_frontend/screens/add_pages/change_page.dart';
import 'package:java_spring_frontend/screens/chat_pages/chat_page.dart';
import 'package:java_spring_frontend/screens/home_pages/main_page.dart';
import 'package:java_spring_frontend/screens/login_pages/login_page.dart';
import 'package:java_spring_frontend/screens/login_pages/welcome_pages.dart';

class DataProvider extends ChangeNotifier {
  String appBarTitle = '7food на карте';
  var _bottomNavIndex = 0;

  List<Widget> _pages = [
    MainPage(),
    LoginPage(),
    ChatPage(),
    ChangePage()
    // ShowcaseItems(0),
  ];

  List<String> _appBarTitles = [
    'В Продаже',
    'Туда',
    'Чат',
    'Профиль',
  ];

  List<String> get appBarTitles => _appBarTitles;

  List<Widget> get pages => _pages;

  get bottomNavIndex => _bottomNavIndex;

  set setBottomNavIndex(value) {
    _bottomNavIndex = value;
    notifyListeners();
  }

  String get getAppBarTitle {
    return appBarTitle;
  }

  String changeAppBarTitle(String title) {
    appBarTitle = title;
    // notifyListeners();
    return appBarTitle;
  }

  // List<int> _requiredNumber = [];
  //
  // List<int> get requiredNumber => _requiredNumber;
  //
  // void addFridgeID() async {
  //   Showcase showcaseID = await ShowcaseService().getShowcase();
  //   for(int i = 0; i < showcaseID.data.length; i++) {
  //     // setState(() {
  //       _requiredNumber.add(
  //           showcaseID.data[i].id
  //       );
  //     // });
  //   }
  //   // notifyListeners();
  // }
}
