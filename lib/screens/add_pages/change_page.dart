import 'package:flutter/material.dart';
import 'package:java_spring_frontend/service/sales_service.dart';

class ChangePage extends StatefulWidget {
  const ChangePage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<ChangePage> {
  TextEditingController idCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var isLoading = false;

  toChange() {
    SalesService()
        .changeSales(idCtrl.text, phoneCtrl.text, emailCtrl.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 361.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  color: Color(0xff47536D),
                ),
              ),
            ],
          ),
          Positioned(
            top: 264.0,
            left: 33.0,
            right: 34.0,
            child: Form(
              key: _formKey,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      Text('Изменить данные',
                          style: TextStyle(
                            color: Color(0xff747373),
                          )),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Id:',
                            labelStyle: TextStyle(
                              color: Color(0xff747373),
                            )),
                        controller: idCtrl,
                        onSaved: (value) => idCtrl.text = value!,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 1) {
                            return 'Enter a valid id!';
                          }
                          return null;
                        },
                      ), //styling
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Color(0xff747373),
                            )),
                        controller: phoneCtrl,
                        onSaved: (value) => phoneCtrl.text = value!,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 2) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Price',
                            labelStyle: TextStyle(
                              color: Color(0xff747373),
                            )),
                        controller: emailCtrl,
                        onSaved: (value) => phoneCtrl.text = value!,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 2) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                height: 227.0,
                width: 308,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      spreadRadius: 5, //spread radius
                      blurRadius: 7, // blur radius
                      offset: Offset(0, 2), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            left: 90.0,
            top: 473.0,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff47536D),
                ),
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid) {
                    _formKey.currentState!.save();
                  }
                  toChange();
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Изменить',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  height: 35.0,
                  width: 195,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      color: Color(0xff47536D)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
