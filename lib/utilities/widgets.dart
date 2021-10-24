import 'package:flutter/material.dart';
import 'package:java_spring_frontend/screens/home_page.dart';

import 'constands.dart';

AppBar appBar(String _title, double _toolbarHeight, Widget _icon, BuildContext context) {
  return AppBar(
    toolbarHeight: _toolbarHeight,
    shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50)
        )
    ),
    automaticallyImplyLeading: false,
    title: Text(
      '$_title',
      textAlign: TextAlign.right,
    ),
    centerTitle: true,
    leading: IconButton(
      icon: _icon,
      onPressed: () {
        if(_title == "Детали добавления"){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
        } else {
          Navigator.pop(context);
        }
      },
    ),
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
