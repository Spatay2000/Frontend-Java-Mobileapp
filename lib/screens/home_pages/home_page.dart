import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:java_spring_frontend/model/provider_model.dart';
import 'package:java_spring_frontend/utilities/constands.dart';
import 'package:java_spring_frontend/utilities/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: appBar(
          '${dataProvider.appBarTitles[dataProvider.bottomNavIndex]}',
          57,
          kBackIcon,
          context),
      body: dataProvider.pages[dataProvider.bottomNavIndex],
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
          ? getFloatingActionButton(context)
          : SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: kBottomNavIconList,
        inactiveColor: kMainColor,
        activeColor: Colors.blue,
        activeIndex: dataProvider.bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) => dataProvider.setBottomNavIndex = index,
      ),
    );
  }
}
