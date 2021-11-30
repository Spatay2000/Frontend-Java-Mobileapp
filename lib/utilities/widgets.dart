import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:java_spring_frontend/model/provider_model.dart';
import 'package:java_spring_frontend/screens/add_pages/add_pages.dart';
import 'package:java_spring_frontend/screens/home_pages/home_page.dart';
import 'package:java_spring_frontend/screens/login_pages/register_page.dart';

import 'constands.dart';

AppBar appBar(
    String _title, double _toolbarHeight, Widget _icon, BuildContext context) {
  return AppBar(
    toolbarHeight: _toolbarHeight,
    shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
    automaticallyImplyLeading: false,
    title: Text(
      '$_title',
      textAlign: TextAlign.right,
    ),
    centerTitle: true,
    leading: IconButton(
      icon: _icon,
      onPressed: () {
        if (_title == "Детали добавления") {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false);
        } else {
          Navigator.pop(context);
        }
      },
    ),
    backgroundColor: kMainColor,
  );
}

AnimatedBottomNavigationBar getBottomBar(
    DataProvider provider, var _bottomNavIndex, context) {
  // DataProvider dataProvider = Provider.of<DataProvider>(context);
  return AnimatedBottomNavigationBar(
    icons: kBottomNavIconList,
    inactiveColor: kMainColor,
    activeColor: Colors.blue,
    activeIndex: _bottomNavIndex,
    gapLocation: GapLocation.center,
    notchSmoothness: NotchSmoothness.defaultEdge,
    onTap: (index) => provider.bottomNavIndex(index),
  );
}

FloatingActionButton getFloatingActionButton(context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddPage()));
    },
    child: const Icon(Icons.card_giftcard),
    backgroundColor: kMainColor,
  );
}

BoxShadow getBoxShadow() {
  return BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 3,
    offset: Offset(0, 3), // changes position of shadow
  );
}

Card getShowcaseCards(String name, double value, context) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: ListTile(
      leading: kMainFridgeImage,
      title: Text(
        'Имя: $name',
        // snapshot.data!.data[index].name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Цена: $value',
        // snapshot.data!.data[index].address,
        style: TextStyle(fontSize: 10),
      ),

      // ShowcaseService().getShowcaseItems(snapshot.data!.data[index].id, context);
      // snapshot.data!.data[index].id
    ),
  );
}
